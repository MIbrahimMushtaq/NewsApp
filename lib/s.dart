import 'package:flutter/material.dart';

class S {
  static String appTitle = 'News App';
  static String apiKey = 'fe6cb7d64919489dbd1ee74ae49f3fee';
}

class Clr{
  static Color primaryColor = Colors.blue.shade800;
  static Color secondColor = Colors.black;
}

class Siz{
  static double titleLarge = 20.0;
  static double standPadding = 16.0;
  static double standMargin = 12.0;

}

class Img {
  static String logo = 'assets/images/logo.png';
}

enum Category {
  GENERAL,
  BUSINESS,
  ENTERTAINMENT,
  HEALTH,
  SCIENCE,
  SPORTS,
  TECHNOLOGY
}

enum ChannelsList{

  bbcnews(name: "BBC News",value:'bbc-news'),
  cbcnews(name: "CBC News",value:'cbc-news'),
  ary(name: "Ary News",value:'ary-news'),
  cryptonews(name: "Crypto News",value:'crypto-coins-news'),
  abcnews(name: "ABC News",value:'abc-news'),
  aljazeera(name: "Al Jazeera",value:'al-jazeera-english'),
  ansa(name: "Ansa News",value:'ansa'),
  espn(name: "espn",value:'espn');

  final String name;
  final String value;

  const ChannelsList({required this.name, required this.value});
  // fortune,
  // fox-news,
  // google-news,
  // news24,
  // vice-news
}