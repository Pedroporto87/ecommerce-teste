import 'package:flutter/material.dart';

String uri = 'http://192.168.0.14:3000';

class GlobalVariaveis {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Concrete',
      'image': "http://placeimg.com/640/480/city",
    },
    {
      'title': 'Granite',
      'image': "http://placeimg.com/640/480/abstract",
    },
    {
      'title': 'Plastic',
      'image': "http://placeimg.com/640/480/people",
    },
    {
      'title': 'Malha',
      'image': "http://placeimg.com/640/480/cats",
    },
    {'title': 'Frozen', 'image': "http://placeimg.com/640/480/technics"},
    {
      'title': 'Cotton',
      'image': "http://placeimg.com/640/480/nature",
    },
    {
      'title': 'Cotton',
      'image': "http://placeimg.com/640/480/nature",
    },
    {
      'title': 'Rubber',
      'image': "http://placeimg.com/640/480/nature",
    },
    {
      'title': 'Rubber',
      'image': "http://placeimg.com/640/480/nature",
    },
    {
      'title': 'Wooden',
      'image': "http://placeimg.com/640/480/nightlife",
    },
    {
      'title': 'Soft',
      'image': "http://placeimg.com/640/480/cats",
    },
    {
      'title': 'Fresh',
      'image': "http://placeimg.com/640/480/fashion",
    },
    {
      'title': 'Bronze',
      'image': "http://placeimg.com/640/480/nature",
    },
    {
      'title': 'Teste',
      'image': "http://placeimg.com/640/480/business",
    }
  ];
}
