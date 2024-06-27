import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:gap/gap.dart';
import 'package:promilo/core/constant/app_constant.dart';
import 'package:promilo/core/constant/theme_constant.dart';
import 'package:promilo/presentation/component/rounded_container_widget.dart';
import 'package:promilo/presentation/component/text_widget.dart';
import 'package:share/share.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedContainerWidget(
                height: 375,
                width: double.maxFinite,
                radius: 16,
                color: ThemeConstant.lightBgGreyColor,
                child: Column(
                  children: [
                    RoundedContainerWidget(
                      height: 325,
                      width: double.maxFinite,
                      radius: 16,
                      child: ImageSlideshow(
                        width: double.infinity,
                        indicatorColor: ThemeConstant.selectedColor,
                        indicatorBackgroundColor: Colors.grey.withOpacity(0.5),
                        indicatorRadius: 6,
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: List.generate(
                          AppConstant.descriptionImageList.length,
                          (index) => Image.asset(
                            AppConstant.descriptionImageList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.file_download_outlined,
                            size: 26,
                            color: ThemeConstant.bgGreyColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_border,
                            size: 26,
                            color: ThemeConstant.bgGreyColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 26,
                            color: ThemeConstant.bgGreyColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.center_focus_weak_outlined,
                            size: 26,
                            color: ThemeConstant.bgGreyColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.star_outline,
                            size: 26,
                            color: ThemeConstant.bgGreyColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () => _shareImage(context),
                          icon: const Icon(
                            Icons.share_outlined,
                            size: 26,
                            color: ThemeConstant.bgGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(10),
              const Row(
                children: [
                  Icon(
                    Icons.bookmark_border,
                    color: ThemeConstant.blueShadeColor,
                    size: 18,
                  ),
                  Gap(3),
                  TextWidget(
                    text: "1034",
                    size: 15,
                  ),
                  Gap(7),
                  Icon(
                    Icons.favorite_border,
                    color: ThemeConstant.blueShadeColor,
                    size: 18,
                  ),
                  Gap(3),
                  TextWidget(
                    text: "1034",
                    size: 15,
                  ),
                  Gap(7),
                ],
              ),
              const Gap(10),
              const TextWidget(
                text: "Actor Name",
                color: ThemeConstant.boldBlueColor,
                size: 18,
                fontWeight: FontWeight.bold,
              ),
              const Gap(10),
              const TextWidget(
                text: "Indian Actress",
              ),
              const Gap(10),
              const Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: ThemeConstant.boldBlueColor,
                    size: 18,
                  ),
                  Gap(5),
                  TextWidget(
                    text: "Duration 20 Min",
                    size: 14,
                  )
                ],
              ),
              const Gap(10),
              const Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: ThemeConstant.boldBlueColor,
                    size: 18,
                  ),
                  Gap(5),
                  TextWidget(text: "Total Average Fees \u20B99,999", size: 14)
                ],
              ),
              const Gap(10),
              const TextWidget(
                text: "About",
                color: ThemeConstant.boldBlueColor,
                size: 18,
                fontWeight: FontWeight.bold,
              ),
              const Gap(5),
              const TextWidget(
                text: AppConstant.dummyText,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _shareImage(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    Share.share(
      'Check out this image!',
      subject: 'Image Share',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }
}
