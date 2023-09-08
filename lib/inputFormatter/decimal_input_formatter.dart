import 'package:flutter/services.dart';

class DecimalInputFormatter extends TextInputFormatter {
  static const int maxDecimalDigits = 2;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Remove any non-digit characters from the new value
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^\d.]'), '');

    // Split the text into integer and decimal parts
    List<String> parts = cleanedText.split('.');

    // Limit the decimal part to two digits
    if (parts.length > 1 && parts[1].length > maxDecimalDigits) {
      parts[1] = parts[1].substring(0, maxDecimalDigits);
    }

    // Reconstruct the text value with proper formatting
    String newText = parts.join('.');

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}


