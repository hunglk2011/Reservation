import 'package:flutter/material.dart';

class CustomDialog {
  static void show(BuildContext context,
      {String title = "Thông báo",
      String content = "Thành công",
      Function? navigation}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (navigation != null) {
                  navigation();
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

class ModalBottomSheet {
  static void showSheet(BuildContext context, VoidCallback onConfirm) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.check_circle_outlined,
                    size: 50,
                    color: Colors.green,
                  ),
                  Text(
                    "Your password has been changed",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Please login again",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  ElevatedButton(
                    child: const Text('LOGIN'),
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
