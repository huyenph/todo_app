import 'package:flutter/material.dart';
import 'package:todo_app/src/presentation/components/todo_button.dart';

class ToDoAlertDialog extends StatelessWidget {
  final String message;
  final String actionLabel;
  final bool isSuccess;
  final VoidCallback? onPressed;

  const ToDoAlertDialog({
    Key? key,
    this.message = '',
    this.onPressed,
    this.actionLabel = 'Ok',
    this.isSuccess = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        isSuccess ? Icons.check_circle_outline : Icons.cancel_outlined,
        color: isSuccess ? Colors.green : Colors.red,
        size: 100.0,
      ),
      content: Text(message, style: const TextStyle(fontSize: 30.0)),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TodoButton(
          onPressed: () {
            Navigator.pop(context);
            if (onPressed != null) {
              onPressed!();
            }
          },
          label: actionLabel,
        ),
      ],
    );
  }
}
