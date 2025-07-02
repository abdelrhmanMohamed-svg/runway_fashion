import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Productfilters extends StatelessWidget {
  const Productfilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black12, width: 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              "Sort by",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Gap(10),
            SvgPicture.asset("assets/svgs/select.svg"),
            Spacer(),
            SvgPicture.asset("assets/svgs/filter.svg"),
            Gap(6),
            Text(
              "Filter",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Gap(17),
            SvgPicture.asset("assets/svgs/grid.svg"),
            Gap(17),
            SvgPicture.asset(
              "assets/svgs/groups.svg",
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
