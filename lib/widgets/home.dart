// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

import 'add_todo.dart';
import 'list.dart';
import 'navigation.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meine TODOs'),
      ),
      body: TodoList(
        page: this.page,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddTodoPage(this.page),
        ),
      );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Navigation(
        this.page,
        (id) => setState(
          () => page = id,
        ),
      ),
    );
  }
}
