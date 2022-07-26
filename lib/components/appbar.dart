import 'package:flutter/material.dart';

import 'package:netflix_responsive_ui_clone/assets.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key, this.scrollOffset = 0.0}) : super(key: key);
  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color:
          Colors.blue.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
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
