import 'package:flutter/material.dart';

class ToDoConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onPressed;

  const ToDoConfirmDialog({
    Key? key,
    this.title = '',
    this.message = '',
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: RichText(
        text: TextSpan(
          children: [
            const WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.orange,
                ),
              ),
            ),
            WidgetSpan(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(fontSize: 20.0),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPressed();
          },
          child: const Text(
            'Ok',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }
}
