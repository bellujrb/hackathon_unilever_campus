import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CPFInputField extends StatelessWidget {
  const CPFInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CPF',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.document_scanner),
            hintText: '000-000-000-00',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            _CpfInputFormatter(),
          ],
        ),
      ],
    );
  }
}

class _CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (text.length > 14) {
      return oldValue;
    }

    String newText = '';
    for (int i = 0; i < text.length; i++) {
      newText += text[i];
      if (i == 2 || i == 5) {
        newText += '-';
      } else if (i == 8) {
        newText += '-';
      }
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}