import 'package:flutter/material.dart';
import 'package:todo/const/colors.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    @required this.text,
    @required this.onPressed,
    this.btnColor,
    this.radius,
    this.iconData,
    super.key,
  });

  final IconData? iconData;
  final Function()? onPressed;
  final String? text;
  final Color? btnColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 15)),
        color: btnColor ?? primaryColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null) ...[
              Icon(
                iconData,
                color: Colors.white,
              ),
              const SizedBox(
                width: 15,
              ),
            ],
            Text(
              text!,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
