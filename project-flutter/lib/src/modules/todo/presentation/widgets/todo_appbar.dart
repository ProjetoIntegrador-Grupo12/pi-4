import 'package:flutter/material.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      centerTitle: true,
      title: const Image(
        image: AssetImage("assets/images/senac-logo.png"),
        fit: BoxFit.cover,
        height: 70,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
