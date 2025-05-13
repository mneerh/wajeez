import '../database.dart';

class SavingsTable extends SupabaseTable<SavingsRow> {
  @override
  String get tableName => 'savings';

  @override
  SavingsRow createRow(Map<String, dynamic> data) => SavingsRow(data);
}

class SavingsRow extends SupabaseDataRow {
  SavingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SavingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get time => getField<int>('time');
  set time(int? value) => setField<int>('time', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int? get money => getField<int>('money');
  set money(int? value) => setField<int>('money', value);
}
