// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../redux/actions.dart' as redux;
import '../redux/store.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(this.item, this.page, {Key? key}) : super(key: key);

  final TODO item;
  final int page;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(this.item.id.toString()),
      background: Container(color: Colors.red),
      onDismissed: (direction) {
        switch (this.page) {
          case 0:
            store.dispatch(
              redux.Action(redux.ActionTypes.REMOVE_HOME_TODO,
                  payload: this.item.id, performSave: true),
            );
            break;
          case 1:
            store.dispatch(
              redux.Action(redux.ActionTypes.REMOVE_LEARNING_TODO,
                  payload: this.item.id, performSave: true),
            );
            break;
          case 2:
            store.dispatch(
              redux.Action(redux.ActionTypes.REMOVE_SOFTWARE_TODO,
                  payload: this.item.id, performSave: true),
            );
            break;
        }
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 5.0,
          top: 5.0,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        width: double.infinity,
        child: Row(
          children: [
            if (this.item.isImportant)
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.label_important,
                  color: Colors.red,
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.item.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(this.item.date),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
