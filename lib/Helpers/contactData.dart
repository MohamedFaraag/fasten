import 'package:flutter/material.dart';

class ContactData {
  static List<Map> data = [
    {
      "id": 1,
      "name": "phone",
    },
    {
      "id": 2,
      "name": "chat",
    },
    {
      "id": 3,
      "name": "whatsup",
    }
  ];
}

class DataForHomeNavBar {
  static List<Map> dataBar = [
    {
      "id": 1,
      "name": "Account",
      "icont": Icons.home_outlined,
    },
    {
      "id": 2,
      "name": "Notfication",
      "icont": Icons.notifications_none_sharp,
    },
    {
      "id": 3,
      "name": "Home",
      "icont": Icons.person_outline_outlined,
    },
    {
      "id": 4,
      "name": "Wish",
      "icont": Icons.chat_bubble_outline,
    },
    {
      "id": 5,
      "name": "Chat",
      "icont": Icons.favorite_outline,
    },
  ];
}
