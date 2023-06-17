import 'package:flutter/cupertino.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key});

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
