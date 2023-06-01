import 'package:flutter/material.dart';

class PopUpWidget extends StatefulWidget {
  const PopUpWidget({super.key});

  @override
  State<PopUpWidget> createState() => _PopUpWidgetState();
}

class _PopUpWidgetState extends State<PopUpWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.more_vert, color: Colors.black),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Icon(Icons.portrait, color: Colors.black),
              ),
              Text('Profile'),
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Icon(Icons.settings, color: Colors.black),
              ),
              Text('Settings'),
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Icon(Icons.logout, color: Colors.black),
              ),
              Text('Exit'),
            ],
          ),
        ),
      ],
    );
  }
}
