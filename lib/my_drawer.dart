import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_2/constants.dart';
import 'package:sample_2/drawerItem.dart';

class MyDrawer extends StatelessWidget {
  final VoidCallback onClick;
  final Function(int index) onSelectedItem;
  final bool isDrawerOpen;
  MyDrawer(
      {Key? key,
      required this.onClick,
      required this.isDrawerOpen,
      required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          onClick();
          return false;
        } else {
          return true;
        }
      },
      child: Container(
        color: kDrawerBackgroundColor,
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding * 2,
              horizontal: kDefaultPadding,
            ),
            itemCount: DrawerItem.drawerItems.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                onSelectedItem(index);
              },
              contentPadding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              tileColor: kPrimaryColor,
              selectedTileColor: Colors.red,
              leading: Icon(
                DrawerItem.drawerItems[index].icon,
                color: kWhiteColor,
                size: 24.0,
              ),
              title: Text(
                DrawerItem.drawerItems[index].title,
                style: GoogleFonts.roboto(
                  color: kWhiteColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
