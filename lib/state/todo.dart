import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "todohttp.dart";

class TodoListState extends ChangeNotifier {
  /// Internal, private state of the cart.

  TodoListState() {
    _getInitialTodo();
  }

  Set<String> todo = {};

  _getInitialTodo() async {
    var prefs = await SharedPreferences.getInstance();
    final todos = await getTodos();
    if (todos.isNotEmpty) {
      todo = {...todos ?? []};
    } else {
      var arrStr = prefs.getStringList('todos');
      todo = {...arrStr ?? []};
    }
    notifyListeners();
  }

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<String> get items => UnmodifiableListView(todo);

  void add(String text) async {
    final prefs = await SharedPreferences.getInstance();
    if (text.trim().isNotEmpty) {
      todo.add(text);
      prefs.setStringList('todos', todo.toList());
      postTodo(text);
      notifyListeners();
    }
  }

  int lenght() {
    return todo.length;
  }

  void deleteAtIndex(text) async {
    final prefs = await SharedPreferences.getInstance();
    todo.remove(text);
    deleteTodo(text);
    prefs.setStringList('todos', todo.toList());
    notifyListeners();
  }

  void updateAtIndex(int index, String text) {
    var list = todo.toList();
    list[index] = text;
    todo = list.toSet();
    notifyListeners();
  }
}
