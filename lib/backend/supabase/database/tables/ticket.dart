import '../database.dart';

class TicketTable extends SupabaseTable<TicketRow> {
  @override
  String get tableName => 'ticket';

  @override
  TicketRow createRow(Map<String, dynamic> data) => TicketRow(data);
}

class TicketRow extends SupabaseDataRow {
  TicketRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TicketTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get checkout => getField<int>('checkout')!;
  set checkout(int value) => setField<int>('checkout', value);

  String? get time => getField<String>('time');
  set time(String? value) => setField<String>('time', value);
}
