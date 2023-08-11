import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({Key? key, required this.titleName}) : super(key: key);
  final String titleName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleName,
        style: Theme.of(context)
            .textTheme
            .bodyLarge, // Use the appropriate text style
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
