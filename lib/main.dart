import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_2/constants.dart';
import 'package:sample_2/get_selected_page.dart';

import 'my_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kSecondaryColor,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  bool isDragging = false;
  bool isDrawerOpen = false;
  int myIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller!,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _toggle() {
    // _controller!.isDismissed ? _controller!.forward() : _controller!.reverse();
    if (_controller!.isDismissed) {
      _controller!.forward();
      setState(() {
        isDrawerOpen = true;
      });
    } else {
      _controller!.reverse();
      setState(() {
        isDrawerOpen = false;
      });
    }
  }

  void onSelectedItem(int index) {
    if (index == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kSecondaryColor,
          content: Text(
            "Logging out...",
            style: GoogleFonts.roboto(
              fontSize: 16.0,
            ),
          ),
        ),
      );
    } else {
      setState(() {
        myIndex = index;
      });
      _toggle();
    }
  }

  void onClicked() {
    _toggle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _toggle,
        onHorizontalDragStart: (DragStartDetails details) {
          print(details);
          isDragging = true;
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          print(details);
          if (!isDragging) {
            return;
          }
          if (details.delta.dx > 1) {
            _toggle();
          } else if (details.delta.dx < -1) {
            _toggle();
          }
          isDragging = false;
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          print(details);
        },
        child: AnimatedBuilder(
          animation: _animation!,
          child: GetSelectedPage(
            onClick: _toggle,
            isDrawerOpen: isDrawerOpen,
            index: myIndex,
          ),
          builder: (context, child) {
            double slide = 225.0 * _controller!.value;
            double scale = 1 - _controller!.value * 0.3;
            return Stack(
              children: [
                MyDrawer(
                  onClick: onClicked,
                  isDrawerOpen: isDrawerOpen,
                  onSelectedItem: onSelectedItem,
                ),
                Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  child: child,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
