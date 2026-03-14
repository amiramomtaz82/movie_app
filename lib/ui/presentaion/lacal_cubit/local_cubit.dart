import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'local_state.dart';


@singleton
class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  Locale currentLocale = const Locale('en');

  void changeLanguage(String languageCode) {
    currentLocale = Locale(languageCode);
    emit(LocaleChanged(currentLocale));
  }
}