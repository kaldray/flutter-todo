import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "./screen/main.dart";
import "./screen/todo_list.dart";
import 'package:provider/provider.dart';
import "./state/todo.dart";

void main() {
  runApp(ChangeNotifierProvider(
    create: (contexte) => TodoListState(),
    child: RootApp(),
  ));
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: TabController(),
    );
  }
}

class TabController extends StatefulWidget {
  const TabController({super.key});

  @override
  State<TabController> createState() => Tab();
}

class Tab extends State<TabController> {
  final CupertinoTabController controller = CupertinoTabController();
  List<Widget> data = [const TodoList(), const TodoScreen()];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.blueGrey,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Todolist",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.plus),
            label: "Ajouter",
          )
        ],
      ),
      tabBuilder: (context, index) {
        return data[index];
      },
    ));
  }
}
