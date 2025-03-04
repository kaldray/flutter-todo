import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListState extends ChangeNotifier {
  /// Internal, private state of the cart.

  TodoListState() {
    _getInitialTodo();
  }

  List<String> todo = [];

  _getInitialTodo() async {
    final prefs = await SharedPreferences.getInstance();
    todo = prefs.getStringList('todos') ?? [];
    notifyListeners();
  }

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<String> get items => UnmodifiableListView(todo);

  void add(String text) async {
    final prefs = await SharedPreferences.getInstance();
    if (text.trim().isNotEmpty) {
      todo.add(text);
      prefs.setStringList('todos', todo);
      notifyListeners();
    }
  }

  int lenght() {
    return todo.length;
  }

  String getTodoAtIndex(index) {
    return todo[index];
  }

  void deleteAtIndex(index) async {
    final prefs = await SharedPreferences.getInstance();
    todo.removeAt(index);
    notifyListeners();
    prefs.setStringList('todos', todo);
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
