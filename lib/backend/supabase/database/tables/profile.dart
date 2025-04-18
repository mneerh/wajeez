import '../database.dart';

class ProfileTable extends SupabaseTable<ProfileRow> {
  @override
  String get tableName => 'profile';

  @override
  ProfileRow createRow(Map<String, dynamic> data) => ProfileRow(data);
}

class ProfileRow extends SupabaseDataRow {
  ProfileRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfileTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get firstName => getField<String>('first name')!;
  set firstName(String value) => setField<String>('first name', value);

  String get lastName => getField<String>('last name')!;
  set lastName(String value) => setField<String>('last name', value);

  String get username => getField<String>('username')!;
  set username(String value) => setField<String>('username', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);
}
