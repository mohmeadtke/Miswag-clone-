class GlobalState {
  static final GlobalState _instance = GlobalState._internal();

  bool isItAuth = false; // Change this value as needed
  bool isItCart = false; // Change this value as needed

  factory GlobalState() {
    return _instance;
  }

  GlobalState._internal();
}
