import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../state/todo.dart';

List<String> todoList = [];

class MyInput extends StatefulWidget {
  const MyInput({super.key});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  String text = "";
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
  }

  void addTodo() {
    setState(() {
      if (_controller.text.trim().isNotEmpty) {
        todoList.add(_controller.text);
      }
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CupertinoTextField(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              controller: _controller,
              enableSuggestions: true,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            Consumer<TodoListState>(builder: (context, todo, child) {
              return CupertinoButton(
                onPressed: () {
                  todo.add(_controller.text);
                  _controller.clear();
                },
                color: Colors.lightBlue,
                pressedOpacity: 0.8,
                child: const Text(
                  "Ajouter",
                  style: TextStyle(color: Colors.black),
                ),
              );
            }),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(todoList[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            todoList.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      color: Color(0XAAE0FF0F),
      title: "Todo app",
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Accueil'),
          ),
          child: SafeArea(
            minimum: EdgeInsets.all(10),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyInput(),
              ],
            ),
          )),
    );
  }
}
