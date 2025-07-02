import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AboutProduct extends StatelessWidget {
  AboutProduct(
      {super.key,
      required this.prefix,
      required this.title,
      required this.postfix});
  final String prefix;
  final String title;
  final String postfix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(prefix),
          Gap(10),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          SvgPicture.asset(postfix),
        ],
      ),
    );
  }
}
