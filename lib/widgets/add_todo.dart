// ignore_for_file: unnecessary_this, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../redux/actions.dart' as redux;
import '../redux/store.dart';

class AddTodoPage extends StatefulWidget {
  AddTodoPage(this.page, {Key? key}) : super(key: key);
  final int page;

  @override
  State<AddTodoPage> createState() => _AddTodoPageState(this.page);
}

class _AddTodoPageState extends State<AddTodoPage> {
  _AddTodoPageState(this.page);

  final int page;

  TextEditingController titleController = TextEditingController();
  DateTime date = DateTime.now();
  bool isImportant = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO erstellen'),
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 30.0,
              ),
              child: TextField(
                controller: this.titleController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2.0),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  labelText: "Titel",
                  labelStyle:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => showDatePicker(
                context: context,
                initialDate: this.date,
                firstDate: DateTime(0),
                lastDate: DateTime(2100),
              ).then(
                (value) => setState(
                  () {
                    this.date = value ?? this.date;
                  },
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                  left: 20.0,
                  right: 20.0,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 4,
                    ),
                  ),
                ),
                child: Text(
                  "Datum: ${this.date.day}.${this.date.month}.${this.date.year}",
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: SwitchListTile(
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (value) async {
                  setState(() {
                    this.isImportant = value;
                  });
                },
                value: this.isImportant,
                title: const Text(
                  "Wichtig",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            ElevatedButton(
                onPressed: () => addTodo(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done, color: Colors.white),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child:
                          Text("Hinzufügen", style: TextStyle(fontSize: 18.0)),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void addTodo(context) {
    int nextID = 0;

    switch (this.page) {
      case 0:
        nextID = store.state.home.isEmpty
            ? 1
            : store.state.home[store.state.home.length - 1].id + 1;
        break;
      case 1:
        nextID = store.state.learning.isEmpty
            ? 1
            : store.state.learning[store.state.learning.length - 1].id + 1;
        break;
      case 2:
        nextID = store.state.software.isEmpty
            ? 1
            : store.state.software[store.state.software.length - 1].id + 1;
        break;
      default:
        return;
    }

    TODO todo = TODO(
      id: nextID,
      title: this.titleController.text,
      date: "${this.date.day}.${this.date.month}.${this.date.year}",
      isImportant: this.isImportant,
    );

    switch (this.page) {
      case 0:
        store.dispatch(redux.Action(
          redux.ActionTypes.ADD_HOME_TODO,
          payload: todo,
          performSave: true,
        ));
        break;
      case 1:
        store.dispatch(redux.Action(
          redux.ActionTypes.ADD_LEARNING_TODO,
          payload: todo,
          performSave: true,
        ));
        break;
      case 2:
        store.dispatch(redux.Action(
          redux.ActionTypes.ADD_SOFTWARE_TODO,
          payload: todo,
          performSave: true,
        ));
        break;
      default:
        return;
    }

    Navigator.pop(context);
  }
}
