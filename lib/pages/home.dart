import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runway_fashion/models/category.dart';
import 'package:runway_fashion/pages/categoriesScreen.dart';
import 'package:runway_fashion/widgets/bottomNavigation_custom.dart';
import 'package:runway_fashion/widgets/custom_appBar.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;
  final List<CategoryModel> categoryList = [
    CategoryModel(image: "assets/images/category/Deals.png", name: "Deals"),
    CategoryModel(image: "assets/images/category/Health.png", name: "Health"),
    CategoryModel(image: "assets/images/category/Kids.png", name: "Kids"),
    CategoryModel(image: "assets/images/category/Men.png", name: "Men"),
    CategoryModel(image: "assets/images/category/Women.png", name: "Women"),
  ];
  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/video/video.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      })
      ..setLooping(true);

    super.initState();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomnavigationCustom(currentIndex: _currentIndex),
      appBar: CustomAppbar(
        prefix: 'assets/svgs/menu.svg',
        title: 'Runway',
        postfix: 'assets/svgs/notification.svg',
      ),
      body: Stack(
        children: [
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 175,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Gap(15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(categoryList.length, (index) {
                          final category = categoryList[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => Categoriesscreen())),
                              child: Column(
                                children: [
                                  Image.asset(
                                    category.image,
                                    width: 75,
                                  ),
                                  Gap(8),
                                  Text(
                                    category.name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
