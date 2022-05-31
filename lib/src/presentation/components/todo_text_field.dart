import 'package:flutter/material.dart';

class TodoTextField extends StatelessWidget {
  final TextEditingController controller;
  final GestureTapCallback? onTap;
  final String hintText;
  final String labelText;
  final int maxLines;
  final bool isRequired;
  final bool isReadOnly;

  const TodoTextField({
    Key? key,
    required this.controller,
    this.onTap,
    required this.hintText,
    required this.labelText,
    this.maxLines = 1,
    this.isRequired = true,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      onTap: onTap,
      controller: controller,
      maxLines: maxLines,
      readOnly: isReadOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        alignLabelWithHint: true,
        suffix: GestureDetector(
          onTap: () => controller.clear(),
          child: const Icon(
            Icons.cancel,
            color: Colors.grey,
            size: 20.0,
          ),
        ),
      ),
      validator: (String? value) {
        return (isRequired && (value == null || value.isEmpty))
            ? '${labelText.replaceAll('*', '')}is required'
            : null;
      },
    );
  }
}
