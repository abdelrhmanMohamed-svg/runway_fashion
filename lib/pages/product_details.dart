import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:runway_fashion/models/product.dart';
import 'package:runway_fashion/widgets/about_product.dart';
import 'package:runway_fashion/widgets/custom_appBar.dart';
import 'package:runway_fashion/widgets/productFilters.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails(
      {super.key, this.title, this.price, this.image, this.prductList});
  final String? title;
  final String? price;
  final String? image;
  final List<ProductModel>? prductList;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ScrollController scrollController = ScrollController();

  void initState() {
    super.initState();

    // Show bottom sheet after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(7)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.16,
          minChildSize: 0.15,
          maxChildSize: 0.7,
          expand: false,
          builder: (context, scrollController) {
            return ListView(
              controller: scrollController,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 42,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      Gap(10),
                      Text(
                        widget.title.toString(),
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Gap(15),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            widget.price.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Spacer(),
                          Icon(Icons.favorite_border_outlined),
                          Gap(10),
                          Text(
                            "450",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Gap(15),
                      Container(
                        height: 55,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(width: 1, color: Colors.black12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Select color",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Gap(14),
                                SvgPicture.asset("assets/svgs/select.svg"),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.black12,
                              endIndent: 1,
                              indent: 1,
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Select size",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Gap(14),
                                SvgPicture.asset("assets/svgs/select.svg"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Gap(13),
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "ADD TO BAG",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Gap(16),
                      Container(
                        width: 390,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black12, width: 1)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/svgs/delivery.svg"),
                                  Gap(10),
                                  Text(
                                    "Free delivery",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/svgs/return.svg"),
                                  Gap(10),
                                  Text(
                                    "Free return",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Text(
                                    "View return policy",
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(15),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "About product",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Gap(18),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black12, width: 1)),
                        child: Column(
                          children: [
                            AboutProduct(
                                prefix: "assets/svgs/list.svg",
                                title: "Product details",
                                postfix: "assets/svgs/arrowUp.svg"),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                            AboutProduct(
                                prefix: "assets/svgs/hanger.svg",
                                title: "Brand",
                                postfix: "assets/svgs/arrowDown.svg"),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                            AboutProduct(
                                prefix: "assets/svgs/measure.svg",
                                title: "Size and fit",
                                postfix: "assets/svgs/arrowDown.svg"),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                            AboutProduct(
                                prefix: "assets/svgs/history.svg",
                                title: "History",
                                postfix: "assets/svgs/arrowDown.svg"),
                          ],
                        ),
                      ),
                      Gap(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Row(
                          children: [
                            Text(
                              "You might also like",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                            children: List.generate(
                          widget.prductList!.length,
                          (index) {
                            final product = widget.prductList![index];
                            return GestureDetector(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                            image: product.image,
                                            price: product.price,
                                            title: product.title, prductList: widget.prductList,
                                          ))),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                padding: EdgeInsets.only(left: 5),
                                width: 160,
                                height: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffECECEC)),
                                        width: 160,
                                        height: 200,
                                        child: Image.asset(product.image)),
                                    Gap(10),
                                    Text(
                                      product.title,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onTap: () => Navigator.pop(context),
        prefix: "assets/svgs/arrow-left.svg",
        title: "Men",
        postfix: "assets/svgs/cart.svg",
      ),
      body: Column(
        children: [
          Productfilters(),
          Gap(13),
          Stack(
            children: [
              Container(
                  width: 500,
                  height: 480,
                  child: Image.asset(widget.image.toString())),
              Positioned(
                  left: 20,
                  right: 20,
                  bottom: 0.5,
                  child: Image.asset("assets/images/shadow.png"))
            ],
          ),
        ],
      ),
    );
  }
}
