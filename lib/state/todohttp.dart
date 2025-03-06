import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<String>> getTodos() async {
  try {
    final response = await http.get(Uri.parse('http://localhost:8000/todos'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.cast<String>(); // Convertir List<dynamic> en List<String>
    }
  } catch (err) {
    return [];
  }
  return [];
}

Future<List<String>> postTodo(String todo) async {
  try {
    final response =
        await http.post(Uri.parse('http://localhost:8000/todos'), body: todo);
    print(response.body);
  } catch (err) {
    return [];
  }
  return [];
}

Future<List<String>> deleteTodo(String todo) async {
  try {
    final response =
        await http.delete(Uri.parse('http://localhost:8000/todos'), body: todo);
  } catch (err) {
    return [];
  }
  return [];
}
