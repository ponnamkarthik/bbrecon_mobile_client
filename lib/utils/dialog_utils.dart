import 'package:bbrecon/app_colors.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static dynamic showErrorDialog(BuildContext context,
      {String title = "", String content = ""}) {
    return showDialog<dynamic>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              )
            ],
          );
        });
  }

  static Future<bool> showDeleteDialog(BuildContext context,
      {String title = "", String content = ""}) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Cancel"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                color: AppColors.primaryColor,
                child: const Text("Delete"),
              )
            ],
          );
        });
  }
}
