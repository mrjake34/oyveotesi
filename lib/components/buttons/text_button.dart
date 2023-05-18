// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainTextButton extends StatelessWidget {
  final Widget buttonWidget;
  final Function() buttonFunction;
  const MainTextButton({
    Key? key,
    required this.buttonWidget,
    required this.buttonFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: buttonFunction, child: buttonWidget);
  }
}
