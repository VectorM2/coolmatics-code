import 'package:flutter/material.dart';

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

  List<String> _equipmentItems = [];
  List<String> get equipmentItems => _equipmentItems;
  set equipmentItems(List<String> value) {
    _equipmentItems = value;
  }

  void addToEquipmentItems(String value) {
    _equipmentItems.add(value);
  }

  void removeFromEquipmentItems(String value) {
    _equipmentItems.remove(value);
  }

  void removeAtIndexFromEquipmentItems(int index) {
    _equipmentItems.removeAt(index);
  }

  void updateEquipmentItemsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _equipmentItems[index] = updateFn(_equipmentItems[index]);
  }

  void insertAtIndexInEquipmentItems(int index, String value) {
    _equipmentItems.insert(index, value);
  }

  List<String> _validdirectory = ['/storage/emulated/0/documents/c.pdf'];
  List<String> get validdirectory => _validdirectory;
  set validdirectory(List<String> value) {
    _validdirectory = value;
  }

  void addToValiddirectory(String value) {
    _validdirectory.add(value);
  }

  void removeFromValiddirectory(String value) {
    _validdirectory.remove(value);
  }

  void removeAtIndexFromValiddirectory(int index) {
    _validdirectory.removeAt(index);
  }

  void updateValiddirectoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _validdirectory[index] = updateFn(_validdirectory[index]);
  }

  void insertAtIndexInValiddirectory(int index, String value) {
    _validdirectory.insert(index, value);
  }
}
