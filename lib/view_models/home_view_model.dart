import 'package:flutter/material.dart';
import 'package:promilo/presentation/screens/meetup_screen.dart';

class HomeViewModel extends ChangeNotifier {
  Widget _activeScreen = MeetupScreen();

  void setActiveScreen() {
    MeetupScreen();
  }
}
