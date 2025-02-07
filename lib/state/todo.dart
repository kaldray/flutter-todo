import 'dart:collection';

import 'package:flutter/material.dart';

class TodoListState extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<String> todo = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<String> get items => UnmodifiableListView(todo);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => todo.length * 42;

  /// Adds [item] to todolist. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(String text) {
    if (text.trim().isNotEmpty) {
      todo.add(text);
    }
    notifyListeners();
  }

  int lenght() {
    return todo.length;
  }

  getTodoAtIndex(index) {
    return todo[index];
  }

  void deleteAtIndex(index) {
    todo.removeAt(index);
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    todo.clear();
    notifyListeners();
  }
}
