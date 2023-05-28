import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:snews/src/feature/presentation/screens/main_screen.dart';
import 'package:snews/src/feature/presentation/screens/settings_screen.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'News',
          baseStyle: const TextStyle(),
          selectedStyle: const TextStyle(),
        ),
        const MainScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Settings',
          baseStyle: const TextStyle(),
          selectedStyle: const TextStyle(),
        ),
        const SettingsScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      isTitleCentered: true,
      backgroundColorMenu: Colors.white,
      backgroundColorAppBar: Colors.white,
      screens: _pages,
      initPositionSelected: 0,
      leadingAppBar: const Icon(
        Icons.menu,
        color: Colors.black,
        size: 25,
      ),
      tittleAppBar: const Text(
        'sNews',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontFamily: 'Ancient',
        ),
      ),
      actionsAppBar: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Icon(
            Icons.account_circle,
            color: Colors.black,
            size: 35,
          ),
        )
      ],
    );
  }
}
