import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  DrawerItem({required this.title, required this.icon});
  static List<DrawerItem> drawerItems = [
    DrawerItem(
      title: "Home",
      icon: FontAwesomeIcons.home,
    ),
    DrawerItem(
      title: "Explore",
      icon: FontAwesomeIcons.compass,
    ),
    DrawerItem(
      title: "Favorites",
      icon: FontAwesomeIcons.heartbeat,
    ),
    DrawerItem(
      title: "Messages",
      icon: FontAwesomeIcons.solidEnvelope,
    ),
    DrawerItem(
      title: "Profile",
      icon: FontAwesomeIcons.userAlt,
    ),
    DrawerItem(
      title: "Settings",
      icon: FontAwesomeIcons.cog,
    ),
    DrawerItem(
      title: "Logout",
      icon: FontAwesomeIcons.signOutAlt,
    ),
  ];
}
