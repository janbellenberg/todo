import 'dart:convert';
import 'package:TODO/redux/actions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/todo.dart';
import '../redux/store.dart';

void saveState() async {
  final prefs = await SharedPreferences.getInstance();

  store.state.home.sort(
    (a, b) => a.id < b.id ? 1 : -1,
  );

  store.state.learning.sort(
    (a, b) => a.id < b.id ? 1 : -1,
  );

  store.state.software.sort(
    (a, b) => a.id < b.id ? 1 : -1,
  );

  prefs.setString("home", jsonEncode(store.state.home));
  prefs.setString("learning", jsonEncode(store.state.learning));
  prefs.setString("software", jsonEncode(store.state.software));
}

void loadState() {
  SharedPreferences.getInstance().then((prefs) {
    jsonDecode(
      prefs.getString("home") ?? "[]",
    ).forEach((item) {
      store.dispatch(
          Action(ActionTypes.ADD_HOME_TODO, payload: TODO.fromJson(item)));
    });

    jsonDecode(
      prefs.getString("learning") ?? "[]",
    ).forEach((item) {
      store.dispatch(
          Action(ActionTypes.ADD_LEARNING_TODO, payload: TODO.fromJson(item)));
    });

    jsonDecode(
      prefs.getString("software") ?? "[]",
    ).forEach((item) {
      store.dispatch(
          Action(ActionTypes.ADD_SOFTWARE_TODO, payload: TODO.fromJson(item)));
    });
  });
}
