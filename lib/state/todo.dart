import 'dart:collection';

import 'package:flutter/material.dart';

class TodoListState extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<String> todo = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<String> get items => UnmodifiableListView(todo);

  void add(String text) {
    if (text.trim().isNotEmpty) {
      todo.add(text);
    }
    notifyListeners();
  }

  int lenght() {
    return todo.length;
  }

  String getTodoAtIndex(index) {
    return todo[index];
  }

  void deleteAtIndex(index) {
    todo.removeAt(index);
    notifyListeners();
  }

  void updateAtIndex(int index, String text) {
    todo[index] = text;
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    todo.clear();
    notifyListeners();
  }
}
