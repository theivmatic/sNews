import 'package:flutter/cupertino.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key});

  // showAlert(
  //   context: context,
  //   builder: (_) => ErrorWidget,
  //   barrierDismissible: false,
  // );

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
