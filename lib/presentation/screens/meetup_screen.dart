import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:promilo/core/constant/asset_constant.dart';
import 'package:promilo/core/constant/theme_constant.dart';
import 'package:promilo/presentation/component/elevated_button.dart';

import '../../core/constant/app_constant.dart';
import '../../core/route/route_name.dart';
import '../component/edit_text_widget.dart';
import '../component/rounded_container_widget.dart';
import '../component/text_widget.dart';

class MeetupScreen extends StatefulWidget {
  const MeetupScreen({super.key});

  @override
  State<MeetupScreen> createState() => _MeetupScreenState();
}

class _MeetupScreenState extends State<MeetupScreen> {
  TextEditingController controller = TextEditingController();
  final CarouselController _carouselController = CarouselController();
  int currentCarousel = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EditTextWidget(
                controller: controller,
                isRequired: false,
                hintText: "Search",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 220,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: AppConstant.carouselList.length ?? 0, // 7,
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              RoundedContainerWidget(
                                radius: 8,
                                height: double.maxFinite,
                                width: double.maxFinite,
                                child: Image.asset(
                                  AppConstant.carouselList[itemIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: double.maxFinite,
                                color: Colors.black26.withOpacity(0.6),
                              ),
                              const Positioned(
                                bottom: 10,
                                left: 10,
                                child: TextWidget(
                                  text: "Popular Meetups\nin India",
                                  color: Colors.white,
                                  size: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          aspectRatio: 2.0,
                          onPageChanged: (index, __) {
                            currentCarousel = index;
                            setState(() {});
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (AppConstant.carouselList ?? []).asMap().entries.map((entry) {
                        return GestureDetector(
                            onTap: () => _carouselController.animateToPage(entry.key),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness == Brightness.dark ? Colors.grey : Colors.grey)
                                      .withOpacity(currentCarousel == entry.key ? 0.9 : 0.4)),
                            ));
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(
              text: "Trending Popular People",
              size: 18,
              fontWeight: FontWeight.bold,
              color: ThemeConstant.boldBlueColor,
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: RoundedContainerWidget(
                                    borderColor: ThemeConstant.boldBlueColor,
                                    child: Icon(Icons.energy_savings_leaf),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: "Author",
                                      color: ThemeConstant.boldBlueColor,
                                      fontWeight: FontWeight.bold,
                                      size: 17,
                                    ),
                                    TextWidget(
                                      text: "1034 Meetups",
                                      size: 13,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1,
                                color: Colors.grey.withOpacity(0.7),
                                width: double.maxFinite,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 250,
                                    child: Stack(
                                      children: [
                                        ...List.generate(
                                          5,
                                          (i) => Positioned(
                                            left: i * 30,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: RoundedContainerWidget(
                                                color: Colors.transparent,
                                                child: Image.asset(
                                                  AppConstant.writeList[i],
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButtonWidget(
                                onPressed: () {},
                                title: "See More",
                                bgColor: ThemeConstant.blueShadeColor,
                                width: 120,
                                height: 35,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(
              text: "Top Trending Meetups",
              size: 18,
              fontWeight: FontWeight.bold,
              color: ThemeConstant.boldBlueColor,
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => InkWell(
                    onTap: () => context.goNamed(RouteName.description),
                    splashColor: ThemeConstant.whiteColor,
                    child: SizedBox(
                      width: 150,
                      height: 180,
                      child: Card(
                        elevation: 5,
                        child: RoundedContainerWidget(
                          radius: 8,
                          width: 150,
                          height: 180,
                          child: Stack(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  width: 150,
                                  height: 180,
                                  AssetConstant.award,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: RoundedContainerWidget(
                                  height: 60,
                                  width: 60,
                                  radius: 8,
                                  color: ThemeConstant.whiteColor,
                                  child: TextWidget(
                                    text: "${index < 10 ? "0" : ""}${index + 1}",
                                    size: 40,
                                    color: ThemeConstant.boldBlueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
