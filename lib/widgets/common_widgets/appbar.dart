import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isTitleCentered;

  const CustomAppbar({
    Key? key,
    required this.title,
    this.isTitleCentered = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: isTitleCentered,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
