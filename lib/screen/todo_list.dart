import 'package:flutter_application_1/state/todo.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

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
                              itemCount: todo.lenght(),
                              itemBuilder: (context, index) {
                                return CupertinoListTile(
                                  title: Text(todo.getTodoAtIndex(index)),
                                  trailing: CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    child: Icon(CupertinoIcons.delete),
                                    onPressed: () {
                                      todo.deleteAtIndex(index);
                                    },
                                  ),
                                );
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
