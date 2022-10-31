import 'package:dev_connector/views/widgets/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textFieldController;
  final Function textFieldValidator;
  final Function()? onTap;
  final String customHintText;
  final TextInputType textInputType;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool isSecure;
  final bool? isEnabled;
  final bool? enableInteractiveSelection;
  final String? helperText;

  const CustomTextField(
      {super.key,
      required this.customHintText,
      required this.textFieldController,
      required this.prefixIcon,
      required this.textInputType,
      required this.isSecure,
      required this.textFieldValidator,
      this.onTap,
      this.suffixIcon,
      this.helperText,
      this.isEnabled,
      this.enableInteractiveSelection
      });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection : enableInteractiveSelection,
        onTap: onTap,
        enabled: isEnabled,
        obscureText: isSecure,
        controller: textFieldController,
        validator: (value) => textFieldValidator(value),
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          helperText: helperText,
          hintText: customHintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: prefixIcon,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: suffixIcon,
          ),
        ));
  }
}
