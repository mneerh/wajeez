import '../database.dart';

class PromocodeTable extends SupabaseTable<PromocodeRow> {
  @override
  String get tableName => 'promocode';

  @override
  PromocodeRow createRow(Map<String, dynamic> data) => PromocodeRow(data);
}

class PromocodeRow extends SupabaseDataRow {
  PromocodeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PromocodeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  double? get value => getField<double>('value');
  set value(double? value) => setField<double>('value', value);

  String? get discount => getField<String>('discount');
  set discount(String? value) => setField<String>('discount', value);
}
