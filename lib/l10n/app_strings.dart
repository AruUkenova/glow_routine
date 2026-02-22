import 'package:flutter/material.dart';

class AppStrings {
  final Locale locale;
  AppStrings(this.locale);

  static AppStrings of(Locale locale) => AppStrings(locale);

  bool get isRu => locale.languageCode == 'ru';

  String get appTitle => isRu ? 'Glow Routine' : 'Glow Routine';
  String get products => isRu ? 'Средства' : 'Products';
  String get routine => isRu ? 'Рутина' : 'Routine';
  String get settings => isRu ? 'Настройки' : 'Settings';

  String get morning => isRu ? 'Утро' : 'Morning';
  String get evening => isRu ? 'Вечер' : 'Evening';

  String get openedAt => isRu ? 'Открыто' : 'Opened';
  String get expiresAt => isRu ? 'Годен до' : 'Expires';
  String get price => isRu ? 'Цена' : 'Price';

  String get localeToggle => isRu ? 'Переключить язык (ru/en)' : 'Toggle language (ru/en)';

  String get token => isRu ? 'Токен (демо)' : 'Token (demo)';
  String get save => isRu ? 'Сохранить' : 'Save';
  String get load => isRu ? 'Загрузить' : 'Load';
  String get delete => isRu ? 'Удалить' : 'Delete';

  String get tabInfo => isRu ? 'Инфо' : 'Info';
  String get tabRoutine => isRu ? 'Рутина' : 'Routine';
}