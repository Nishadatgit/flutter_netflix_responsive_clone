import 'package:flutter/material.dart';
import 'package:netflix_responsive_ui_clone/components/reponsive.dart';

import 'package:netflix_responsive_ui_clone/models/content_model.dart';
import 'package:video_player/video_player.dart';

import 'vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);
  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _ContentHeaderMobile(
          featuredContent: featuredContent,
        ),
        desktop: _ContentHeaderDesktop(
          featuredContent: featuredContent,
        ));
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _ContentHeaderMobile({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl!),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                  icon: Icons.add, title: 'List', onTap: () => print('List')),
              _PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outline,
                  title: 'Info',
                  onTap: () => print('Info'))
            ],
          ),
        )
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  const _ContentHeaderDesktop({super.key, required this.featuredContent});
  final Content featuredContent;

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController videoPlayerController;
  bool isMuted = true;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.network(widget.featuredContent.videoUrl!)
          ..initialize().then((value) {
            setState(() {});
          })
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        videoPlayerController.value.isPlaying
            ? videoPlayerController.pause()
            : videoPlayerController.play();
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: videoPlayerController.value.isInitialized
                ? videoPlayerController.value.aspectRatio
                : 2.344,
            child: videoPlayerController.value.isInitialized
                ? VideoPlayer(videoPlayerController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            child: AspectRatio(
              aspectRatio: videoPlayerController.value.isInitialized
                  ? videoPlayerController.value.aspectRatio
                  : 2.344,
              child: Container(
                height: 500,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
          ),
          Positioned(
            left: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.asset(
                    widget.featuredContent.titleImageUrl!,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.featuredContent.description!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      shadows: [
                        Shadow(
                            offset: Offset(2, 4),
                            color: Colors.black,
                            blurRadius: 6)
                      ]),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _PlayButton(),
                    const SizedBox(width: 16),
                    TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white),
                      label: const Text(
                        "More info",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      icon: const Icon(Icons.info_outline),
                    ),
                    if (videoPlayerController.value.isInitialized)
                      IconButton(
                          onPressed: () => setState(() {
                                isMuted
                                    ? videoPlayerController.setVolume(100)
                                    : videoPlayerController.setVolume(0);
                                isMuted =
                                    videoPlayerController.value.volume == 0;
                              }),
                          icon: Icon(
                            isMuted ? Icons.volume_off : Icons.volume_up,
                            color: Colors.white,
                            size: 30,
                          ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.fromLTRB(15, 5, 20, 5)),
      onPressed: () {
        print('Play');
      },
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: Colors.black,
      ),
      label: const Text(
        'Play',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
