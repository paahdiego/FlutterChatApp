import 'package:flutter/material.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';

import 'package:flutter_chat_app/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = AppColors.kPrimaryColor,
    this.padding,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      padding: EdgeInsets.all(sizes.defaultPaddingValue * 0.75),
      color: color,
      minWidth: double.infinity,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
