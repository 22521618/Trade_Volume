import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoubleInputContainer extends StatelessWidget {
  final TextEditingController controller;
  final String nameInput;
  const DoubleInputContainer(
      {super.key, required this.controller, required this.nameInput});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: false,
        ),
        decoration: InputDecoration(
          labelText: nameInput.toString(),
          hintText: nameInput.toString(),
          hintStyle: GoogleFonts.montserrat(),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.greenAccent),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
