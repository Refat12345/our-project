import 'package:flutter/material.dart';
Widget TextFormFieldCompany(
    {
      required TextEditingController controller,
      required String hintText,
    }
    )
{
  return TextFormField(
    textDirection: TextDirection.rtl,
    controller: controller,
    cursorColor: Colors.teal,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade200,
      contentPadding: const EdgeInsets.all(17),
    //  label: Text(labeText),
      hintText: hintText,
      hintTextDirection: TextDirection.rtl,
      hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade700),
      labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.black),

      enabledBorder: OutlineInputBorder(
        borderSide:
        const BorderSide(color: Colors.teal, width: 2),
        borderRadius: BorderRadius.circular(40),
      ),
      floatingLabelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey, width: 1.5),
        borderRadius: BorderRadius.circular(40.0),
      ),
    ),
  );
}
