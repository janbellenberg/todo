import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      supportedLocales: const [Locale("de", "DE")],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: StoreProvider(
        store: store,
        child: HomePage(),
      ),
    );
  }
}
