import 'package:flutter/material.dart';

import 'package:machine_test/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final OutlinedBorder? shape;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  final String buttonTitle;
  const ButtonWidget({
    Key? key,
    this.backgroundColor,
    this.shape,
    this.padding,
    this.onTap,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? blueDarkColor,
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
            shape: shape ??
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
        onPressed: onTap ?? () {},
        child: Text(
          buttonTitle,
          style: textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}
