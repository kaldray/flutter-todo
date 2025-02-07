import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../state/todo.dart';

List<String> todoList = [];

class MyInput extends StatefulWidget {
  final (int, String) todo;

  const MyInput({super.key, required this.todo});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  String text = "";
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.todo.$2);
  }

  @override
  Widget build(BuildContext parentcontext) {
    return Column(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoTextField(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            controller: _controller,
            enableSuggestions: true,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 10),
          Consumer<TodoListState>(builder: (context, todo, child) {
            return CupertinoButton(
              onPressed: () {
                todo.updateAtIndex(widget.todo.$1, _controller.text);
                _controller.clear();
              },
              color: Colors.lightBlue,
              pressedOpacity: 0.8,
              child: const Text(
                "Modifier",
                style: TextStyle(color: Colors.black),
              ),
            );
          }),
        ],
      )
    ]);
  }
}

class TodoUpdateScreen extends StatelessWidget {
  final (int, String) todo;
  const TodoUpdateScreen({super.key, required this.todo});
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      color: Color(0XAAE0FF0F),
      title: "Todo app",
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Modifier'),
            leading: IconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          child: SafeArea(
            minimum: EdgeInsets.all(10),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyInput(
                  todo: todo,
                ),
              ],
            ),
          )),
    );
  }
}
