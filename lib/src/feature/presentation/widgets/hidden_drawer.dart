import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:snews/src/feature/presentation/screens/news/business.dart';
import 'package:snews/src/feature/presentation/screens/news/politics.dart';
import 'package:snews/src/feature/presentation/screens/news/world.dart';
import 'package:snews/src/feature/presentation/widgets/popup_menu.dart';

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
          name: 'World',
          baseStyle: hiddenDrawerMenuTextStyle,
          selectedStyle: hiddenDrawerMenuTextStyle,
          colorLineSelected: Colors.black,
        ),
        const WorldScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Business',
          baseStyle: hiddenDrawerMenuTextStyle,
          selectedStyle: hiddenDrawerMenuTextStyle,
          colorLineSelected: Colors.black,
        ),
        const BusinessScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Politics',
          baseStyle: hiddenDrawerMenuTextStyle,
          selectedStyle: hiddenDrawerMenuTextStyle,
          colorLineSelected: Colors.black,
        ),
        const PoliticsScreen(),
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
      tittleAppBar: const Text(
        'sNews',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontFamily: 'Ancient',
        ),
      ),
      actionsAppBar: 
      const [
        PopUpWidget(),
      ],
    );
  }
}
