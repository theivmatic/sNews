import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform, exit;

import 'package:flutter/services.dart';

class ErrorAlertWidget extends StatelessWidget {
  const ErrorAlertWidget({super.key, required this.reloadScreen});

  final void Function() reloadScreen; 

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AlertDialog(
        title: const Text('Something went wrong'),
        backgroundColor: const Color.fromARGB(255, 160, 160, 160),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          MaterialButton(
            onPressed: reloadScreen,
            child: const Text('Try again'),
          ),
          MaterialButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text('Exit'),
          ),
        ],
      );
    } else if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: const Text('Something went wrong'),
        actions: [
          CupertinoDialogAction(
            onPressed: reloadScreen,
            child: const Text('Try again'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              exit(0);
            },
            child: const Text('Exit'),
          ),
        ],
      );
    } else {
      return const Scaffold();
    }
  }
}
