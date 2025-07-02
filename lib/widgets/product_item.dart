import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  ProductItem(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      this.onTap});
  final String image;
  final String title;
  final String price;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 6),
                  width: 200,
                  height: 255,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffECECEC)),
                  child: Image.asset(image)),
              Positioned(
                  left: 20,
                  right: 20,
                  top: 225,
                  child: Image.asset("assets/images/shadow.png"))
            ],
          ),
          Gap(10),
          Text(
            title,
            maxLines: 1,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                price,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              Icon(Icons.favorite_border_outlined)
            ],
          )
        ],
      ),
    );
  }
}
