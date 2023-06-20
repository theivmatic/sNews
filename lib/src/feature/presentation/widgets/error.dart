import 'package:flutter/cupertino.dart';

class ErrorAlertWidget extends StatelessWidget {
  const ErrorAlertWidget({super.key});

  // showAlert() {
  //   return const ErrorWidget();
  // }

  @override
  Widget build(BuildContext context) {
    return const CupertinoAlertDialog(
      title: Text('Something went wrong'),
      actions: [
        CupertinoDialogAction(
          child: Text('Try again'),
        ),
        CupertinoDialogAction(
          child: Text('Exit'),
        ),
      ],
    );
  }
}
