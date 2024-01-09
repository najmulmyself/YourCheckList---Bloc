import 'package:flutter/material.dart';

const kSpaceSM = 10.0;
const kSpaceMD = 15.0;
const kSpaceLG = 30.0;

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class DividerThickness extends StatelessWidget {
  const DividerThickness({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 0.6,
    );
  }
}
