import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'redux/store.dart';
import 'service/storage.dart';
import 'widgets/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    loadState();
    return MaterialApp(
      title: 'Meine TODOs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreProvider(
        store: store,
        child: HomePage(),
      ),
    );
  }
}
