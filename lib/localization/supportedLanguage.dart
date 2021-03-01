import 'package:flutter/material.dart';

class Language {
  final int id;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.languageCode);
  static List<Language> languageList() {
    return <Language>[
      Language(1, 'اللغة الانجليزية ', 'en'),
      Language(2, 'اللغة العربية', 'ar'),
    ];
  }
}

class ConstData {
  final int id;
  final String name;
  final IconData icon;

  ConstData(this.id, this.name, this.icon);
  static List<ConstData> datalist() {
    return <ConstData>[
      ConstData(
        1,
        'Account',
        Icons.person_outline_outlined,
      ),
      ConstData(
        2,
        'Notfication',
        Icons.notifications_none_sharp,
      ),
      ConstData(
        3,
        'Home',
        Icons.home_outlined,
      ),
      ConstData(
        4,
        'Wish',
        Icons.favorite_outline,
      ),
      ConstData(
        5,
        'Chat',
        Icons.chat_bubble_outline,
      ),
    ];
  }
}
