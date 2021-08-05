import 'package:flutter/material.dart';
import 'package:sample_2/main_page.dart';

class GetSelectedPage extends StatelessWidget {
  final VoidCallback onClick;
  final bool isDrawerOpen;
  final int index;
  const GetSelectedPage(
      {Key? key, 
      required this.onClick, 
      required this.isDrawerOpen,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        return MainPage(onClick: onClick, isDrawerOpen: isDrawerOpen, index: 1);
      case 2:
        return MainPage(onClick: onClick, isDrawerOpen: isDrawerOpen, index: 2);
      case 3:
        return MainPage(onClick: onClick, isDrawerOpen: isDrawerOpen, index: 3);
      case 4:
        return MainPage(onClick: onClick, isDrawerOpen: isDrawerOpen, index: 4);
      case 5:
        return MainPage(onClick: onClick, isDrawerOpen: isDrawerOpen, index: 5);
      default: 
      return MainPage(onClick: onClick, isDrawerOpen: isDrawerOpen , index: 0);
    }
  }
}
