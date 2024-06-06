import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final MaterialColor color;

  const MyElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      child: Text(label),
    );
  }
}
