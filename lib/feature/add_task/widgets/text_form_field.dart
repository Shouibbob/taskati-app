import 'package:flutter/material.dart';

textFormField({required double border, required Color color}) {
  TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(border),
        borderSide: BorderSide(
          color: color,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(border),
        borderSide: BorderSide(color: color),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(border),
        borderSide: BorderSide(color: color),
      ),
    ),
  );
}
