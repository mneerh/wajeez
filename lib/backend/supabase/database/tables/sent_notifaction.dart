import '../database.dart';

class SentNotifactionTable extends SupabaseTable<SentNotifactionRow> {
  @override
  String get tableName => 'sent Notifaction';

  @override
  SentNotifactionRow createRow(Map<String, dynamic> data) =>
      SentNotifactionRow(data);
}

class SentNotifactionRow extends SupabaseDataRow {
  SentNotifactionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SentNotifactionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
