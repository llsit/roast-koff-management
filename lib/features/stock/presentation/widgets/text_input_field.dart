import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String? value;
  final Function(String) onChanged;
  final double width;
  final TextInputType type;

  const TextInputField({
    super.key,
    this.value,
    required this.onChanged,
    this.width = 100,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        controller: TextEditingController(text: value),
        keyboardType: type,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}
