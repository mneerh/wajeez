import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _offers = ['https://ibb.co/cN6D51M'];
  List<String> get offers => _offers;
  set offers(List<String> value) {
    _offers = value;
  }

  void addToOffers(String value) {
    offers.add(value);
  }

  void removeFromOffers(String value) {
    offers.remove(value);
  }

  void removeAtIndexFromOffers(int index) {
    offers.removeAt(index);
  }

  void updateOffersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    offers[index] = updateFn(_offers[index]);
  }

  void insertAtIndexInOffers(int index, String value) {
    offers.insert(index, value);
  }
}
