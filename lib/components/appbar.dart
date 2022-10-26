import 'package:flutter/material.dart';

import 'package:netflix_responsive_ui_clone/assets.dart';
import 'package:netflix_responsive_ui_clone/components/reponsive.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key, this.scrollOffset = 0.0}) : super(key: key);
  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        color: Colors.black
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        child: Responsive(
            mobile: _CustomMobileAppBar(), desktop: _CustomDesktopAppBar()));
  }
}

class _CustomDesktopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppbarButton(title: 'Home', ontap: () {}),
                _AppbarButton(title: 'Tv Shows', ontap: () {}),
                _AppbarButton(title: 'Movies', ontap: () {}),
                _AppbarButton(title: 'Latest', ontap: () {}),
                _AppbarButton(title: 'My List', ontap: () {}),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  padding: EdgeInsets.zero,
                  iconSize: 28,
                ),
                _AppbarButton(title: 'KIDS', ontap: () {}),
                _AppbarButton(title: 'DVD', ontap: () {}),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.card_giftcard),
                  padding: EdgeInsets.zero,
                  iconSize: 28,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                  padding: EdgeInsets.zero,
                  iconSize: 28,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomMobileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppbarButton(title: 'Tv Shows', ontap: () {}),
                _AppbarButton(title: 'Movies', ontap: () {}),
                _AppbarButton(title: 'My List', ontap: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppbarButton extends StatelessWidget {
  const _AppbarButton({Key? key, required this.title, required this.ontap})
      : super(key: key);
  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
