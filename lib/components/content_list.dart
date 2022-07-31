import 'package:flutter/material.dart';
import 'package:netflix_responsive_ui_clone/models/content_model.dart';

class ContentList extends StatelessWidget {
  const ContentList(
      {super.key,
      required this.contentList,
      required this.title,
      this.isOriginals = false});

  final List<Content> contentList;
  final String title;
  final bool isOriginals;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: isOriginals ? 500 : 220,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              final Content content = contentList[index];
              return GestureDetector(
                onTap: () {
                  print(content.name);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: isOriginals ? 400 : 200,
                  width: isOriginals ? 200 : 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover)),
                ),
              );
            },
            itemCount: contentList.length,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            scrollDirection: Axis.horizontal,
          ),
        )
      ]),
    );
  }
}
