import '../database.dart';

class CheckoutTable extends SupabaseTable<CheckoutRow> {
  @override
  String get tableName => 'checkout';

  @override
  CheckoutRow createRow(Map<String, dynamic> data) => CheckoutRow(data);
}

class CheckoutRow extends SupabaseDataRow {
  CheckoutRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CheckoutTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);

  String get userId => getField<String>('userId')!;
  set userId(String value) => setField<String>('userId', value);

  double get amountPerTicket => getField<double>('amountPerTicket')!;
  set amountPerTicket(double value) =>
      setField<double>('amountPerTicket', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  String? get promocode => getField<String>('promocode');
  set promocode(String? value) => setField<String>('promocode', value);

  double get amountAfterDiscount => getField<double>('amountAfterDiscount')!;
  set amountAfterDiscount(double value) =>
      setField<double>('amountAfterDiscount', value);

  double get discountAmount => getField<double>('discount_amount')!;
  set discountAmount(double value) =>
      setField<double>('discount_amount', value);

  int get numOfTickets => getField<int>('numOfTickets')!;
  set numOfTickets(int value) => setField<int>('numOfTickets', value);

  bool get success => getField<bool>('success')!;
  set success(bool value) => setField<bool>('success', value);

  int get checkoutId => getField<int>('checkout_id')!;
  set checkoutId(int value) => setField<int>('checkout_id', value);

  String? get time => getField<String>('time');
  set time(String? value) => setField<String>('time', value);
}
