enum ActionTypes {
  ADD_HOME_TODO,
  ADD_LEARNING_TODO,
  ADD_SOFTWARE_TODO,
  REMOVE_HOME_TODO,
  REMOVE_LEARNING_TODO,
  REMOVE_SOFTWARE_TODO,
  CLEAR,
}

class Action {
  ActionTypes type;
  bool performSave;
  dynamic payload;

  Action(
    this.type, {
    this.payload = null,
    this.performSave = false,
  });
}
