import '../database.dart';

class TicketsMenuTable extends SupabaseTable<TicketsMenuRow> {
  @override
  String get tableName => 'TicketsMenu';

  @override
  TicketsMenuRow createRow(Map<String, dynamic> data) => TicketsMenuRow(data);
}

class TicketsMenuRow extends SupabaseDataRow {
  TicketsMenuRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TicketsMenuTable();

  String get type => getField<String>('Type')!;
  set type(String value) => setField<String>('Type', value);

  int get id => getField<int>('ID')!;
  set id(int value) => setField<int>('ID', value);

  double get price => getField<double>('Price')!;
  set price(double value) => setField<double>('Price', value);

  String get description => getField<String>('Description')!;
  set description(String value) => setField<String>('Description', value);

  String? get time => getField<String>('time');
  set time(String? value) => setField<String>('time', value);
}
