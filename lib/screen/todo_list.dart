import 'package:flutter_application_1/state/todo.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import "./update_todo.dart";

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Ma todo liste"),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<TodoListState>(
                builder: (context, todo, child) => Stack(
                  children: [
                    SizedBox(
                      height: 700,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: todo.todo.length,
                              itemBuilder: (context, index) {
                                return CupertinoListTile(
                                    title: Text(todo.todo.elementAt(index)),
                                    trailing: Row(
                                      children: [
                                        CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          child: Icon(CupertinoIcons.delete),
                                          onPressed: () {
                                            var text =
                                                todo.todo.elementAt(index);
                                            todo.deleteAtIndex(text);
                                          },
                                        ),
                                        CupertinoButton(
                                          padding: EdgeInsets.zero,
                                          child: Icon(CupertinoIcons.pencil),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        TodoUpdateScreen(
                                                          todo: (
                                                            index,
                                                            todo.todo.elementAt(
                                                                index)
                                                          ),
                                                        )));
                                          },
                                        ),
                                      ],
                                    ));
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
