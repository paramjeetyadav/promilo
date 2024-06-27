import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:promilo/core/constant/asset_constant.dart';
import 'package:promilo/core/constant/theme_constant.dart';
import 'package:promilo/presentation/component/text_widget.dart';

import '../../core/route/route_name.dart';

class BaseHomeScreen extends StatefulWidget {
  final Widget child;
  const BaseHomeScreen({
    super.key,
    required this.child,
  });

  @override
  State<BaseHomeScreen> createState() => _BaseHomeScreenState();
}

class _BaseHomeScreenState extends State<BaseHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.routeInformationProvider.value.uri.toString();
    String title = getTitleFromLocation(location);
    return Scaffold(
      backgroundColor: ThemeConstant.whiteColor,
      appBar: AppBar(
        title: TextWidget(
          text: title,
          size: 22,
          fontWeight: FontWeight.w400,
          color: ThemeConstant.whiteColor,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: title.contains("Meetup")
            ? const SizedBox.shrink()
            : IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                iconSize: 20.0,
                color: ThemeConstant.whiteColor,
                onPressed: () {
                  context.goNamed(RouteName.meetup);
                },
              ),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ThemeConstant.whiteColor,
        type: BottomNavigationBarType.fixed, // This is the default for less than four items
        currentIndex: 2,
        selectedItemColor: ThemeConstant.selectedColor,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetConstant.homeIcon,
              width: 35,
              height: 35,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetConstant.proletIcon,
              width: 35,
              height: 35,
            ),
            label: 'Prolet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetConstant.meetupIcon,
              width: 35,
              height: 35,
            ),
            label: 'Meetup',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetConstant.exploreIcon,
              width: 35,
              height: 35,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetConstant.accountIcon,
              width: 35,
              height: 35,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  String getTitleFromLocation(String path) {
    if (path.contains(RouteName.meetup)) {
      return "Individual Meetup";
    }
    return "Description";
  }
}
