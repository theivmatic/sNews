import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:snews/generated/l10n.dart';
import 'package:snews/src/feature/presentation/screens/main_screen.dart';
import 'package:snews/src/feature/presentation/screens/settings_screen.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final hiddenDrawerMenuTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: S.of(context).hidden_drawer_news,
          baseStyle: hiddenDrawerMenuTextStyle,
          selectedStyle: hiddenDrawerMenuTextStyle,
          colorLineSelected: Colors.black,
        ),
        const MainScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: S.of(context).hidden_drawer_settings,
          baseStyle: hiddenDrawerMenuTextStyle,
          selectedStyle: hiddenDrawerMenuTextStyle,
          colorLineSelected: Colors.black,
        ),
        const SettingsScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      slidePercent: 30,
      isTitleCentered: true,
      backgroundColorMenu: const Color.fromARGB(255, 172, 172, 172),
      backgroundColorAppBar: Colors.white,
      screens: _pages,
      initPositionSelected: 0,
      leadingAppBar: const Icon(
        Icons.menu,
        color: Colors.black,
        size: 25,
      ),
      tittleAppBar: Text(
        S.of(context).appbar_title,
        style: const TextStyle(
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
