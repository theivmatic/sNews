import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ErrorAlertWidget extends StatelessWidget {
  const ErrorAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AlertDialog(
        title: const Text('Something went wrong'),
        backgroundColor: const Color.fromARGB(255, 160, 160, 160),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          MaterialButton(
            onPressed: () {},
            child: const Text('Try again'),
          ),
          MaterialButton(
            onPressed: () {},
            child: const Text('Exit'),
          ),
        ],
      );
    } else if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: const Text('Something went wrong'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {},
            child: const Text('Try again'),
          ),
          CupertinoDialogAction(
            onPressed: () {},
            child: const Text('Exit'),
          ),
        ],
      );
    } else {
      return const Scaffold();
    }
  }
}
