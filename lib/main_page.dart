import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_2/drawerItem.dart';

class MainPage extends StatelessWidget {
  final VoidCallback onClick;
  final bool isDrawerOpen;
  final int index;
  const MainPage({Key? key, 
  required this.onClick, 
  required this.isDrawerOpen,
  required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isDrawerOpen ? 16.0 : 0.0),
        bottomLeft: Radius.circular(isDrawerOpen ? 16.0 : 0.0),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: onClick,
            icon: Icon(FontAwesomeIcons.bars),
            iconSize: 28.0,
          ),
          title: Text(
            DrawerItem.drawerItems[index].title,
            style: GoogleFonts.roboto(
              fontSize: 22.0,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor.withOpacity(0.2),
          ),
          child: Center(
            child: Text(
              DrawerItem.drawerItems[index].title,
              style: GoogleFonts.oswald(
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
