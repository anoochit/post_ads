import 'package:flutter/material.dart';

class MenuItem {
  String title;
  IconData icon;
  MenuItem({
    required this.title,
    required this.icon,
  });
}

List<MenuItem> listMenus = [
  MenuItem(title: 'Feed', icon: Icons.rss_feed),
  MenuItem(title: 'Friends', icon: Icons.people_alt),
  MenuItem(title: 'Message', icon: Icons.chat_bubble),
  MenuItem(title: 'Profile', icon: Icons.account_circle),
];
