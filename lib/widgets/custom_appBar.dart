import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key,
      required this.prefix,
      required this.title,
      required this.postfix, this.onTap});
  final String prefix;
  final String title;
  final String postfix;
  final Function()? onTap;
  @override
  Size get preferredSize => Size.fromHeight(80);
  Widget build(BuildContext context) {
    return AppBar(
        scrolledUnderElevation: 0.0,
        leading: SizedBox.shrink(),
        leadingWidth: 0.0,
        toolbarHeight: preferredSize.height,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                prefix,
                width: 24,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              postfix,
              width: 20,
            ),
          ],
        ));
  }
}
