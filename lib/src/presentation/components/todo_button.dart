import 'package:flutter/material.dart';

class TodoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const TodoButton({
    Key? key,
    required this.onPressed,
    this.label = 'Create',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          backgroundColor: Colors.blue,
          primary: Colors.white,
        ),
      ),
    );
  }
}
