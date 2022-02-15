import 'package:TODO/service/storage.dart';

import '../model/app_state.dart';
import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action.type == ActionTypes.ADD_HOME_TODO) {
    state.home.add(action.payload);
  } else if (action.type == ActionTypes.ADD_LEARNING_TODO) {
    state.learning.add(action.payload);
  } else if (action.type == ActionTypes.ADD_SOFTWARE_TODO) {
    state.software.add(action.payload);
  } else if (action.type == ActionTypes.REMOVE_HOME_TODO) {
    state.home.removeWhere((element) => element.id == action.payload);
  } else if (action.type == ActionTypes.REMOVE_LEARNING_TODO) {
    state.learning.removeWhere((element) => element.id == action.payload);
  } else if (action.type == ActionTypes.REMOVE_SOFTWARE_TODO) {
    state.software.removeWhere((element) => element.id == action.payload);
  }

  if (action.performSave) {
    saveState();
  }

  return state;
}
