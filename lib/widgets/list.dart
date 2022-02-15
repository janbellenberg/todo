// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

import '../model/app_state.dart';
import '../model/todo.dart';
import 'item.dart';

class TodoList extends StatelessWidget {
  const TodoList({required this.page, Key? key}) : super(key: key);

  final int page;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (ctx, state) {
          late List<TODO> items;

          switch (this.page) {
            case 0:
              items = state.home;
              break;
            case 1:
              items = state.learning;
              break;
            case 2:
              items = state.software;
              break;
            default:
              return Container();
          }

          items.sort(
            (a, b) =>
                DateFormat("dd.MM.yyyy")
                    .parse(a.date)
                    .compareTo(DateFormat("dd.MM.yyyy").parse(b.date)) *
                -1,
          );

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return TodoItem(items[index], this.page);
            },
          );
        });
  }
}
