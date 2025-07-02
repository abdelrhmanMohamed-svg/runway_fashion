import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runway_fashion/models/product.dart';
import 'package:runway_fashion/pages/product_details.dart';
import 'package:runway_fashion/widgets/custom_appBar.dart';
import 'package:runway_fashion/widgets/productFilters.dart';
import 'package:runway_fashion/widgets/product_item.dart';

class Categoriesscreen extends StatelessWidget {
  Categoriesscreen({super.key});
  List<ProductModel> productList = [
    ProductModel(
        image: "assets/images/models/model1.png",
        title: "Top man black",
        price: "£20"),
    ProductModel(
        image: "assets/images/models/model2.png",
        title: "Deep gray essential regul..",
        price: "£25"),
    ProductModel(
        image: "assets/images/models/model3.png",
        title: "Top man black with Trous..",
        price: "£46"),
    ProductModel(
        image: "assets/images/models/model4.png",
        title: "Gray coat and white T-sh..",
        price: "£30"),
  ];
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  itemCount: productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 4,
                      childAspectRatio: 1 / 1.9,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final product = productList[index];
                    return ProductItem(
                      image: product.image,
                      title: product.title,
                      price: product.price,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            image: product.image,
                            title: product.title,
                            price: product.price,
                            prductList: productList,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
