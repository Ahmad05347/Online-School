abstract class AppEvents {
  const AppEvents();
}

class TrigerAppEvent extends AppEvents {
  final int index;
  const TrigerAppEvent(this.index) : super();
}
