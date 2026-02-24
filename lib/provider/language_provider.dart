import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier{

  String currentLocal ="en";
  void updateLocale(String newLocale){

    currentLocal=newLocale;
    notifyListeners();
  }
}