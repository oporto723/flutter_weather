import 'package:flutter/material.dart';

// Todo:  Maybe better to be Stateless Widget
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              //Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      title: Text(
        'Weather Forecast',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
