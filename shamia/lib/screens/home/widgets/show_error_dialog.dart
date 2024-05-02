import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowErrorDialog {
  run(BuildContext context, var e, {VoidCallback? onYes, VoidCallback? onNo}) {
    bool isIOS = Platform.isIOS;
    if (isIOS) {
      showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => CupertinoAlertDialog(
          title: const Text(
            'Alert',
            style: TextStyle(fontSize: 16.0, color: Colors.red),
          ),
          content: Text(
            e.toString(),
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          actions: [
            Visibility(
              visible: onNo != null,
              child: CupertinoDialogAction(
                onPressed: onNo,
                child: const Text("Cancel"),
              ),
            ),
            Visibility(
              visible: onNo != null,
              child: CupertinoDialogAction(
                onPressed: onYes,
                child: const Text("Ok"),
              ),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Alert',
              style: TextStyle(fontSize: 16.0, color: Colors.red),
            ),
            content: Text(
              e.toString(),
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            actions: <Widget>[
              Visibility(
                visible: onNo != null,
                child: TextButton(
                  onPressed: onNo,
                  child: const Text('Cancel'),
                ),
              ),
              Visibility(
                visible: onYes != null,
                child: TextButton(
                  onPressed: onYes,
                  child: const Text('Ok'),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
