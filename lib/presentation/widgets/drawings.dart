import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import '../../data/model/drawings.dart';

class Drawings extends StatelessWidget {
  final List<Drawing> data;

  const Drawings({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.8);
    return SizedBox(
      height: 250,
      child: PageView(
          pageSnapping: true,
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: data
              .map((e) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: CachedNetworkImage(
                      width: 250,
                      height: 250,
                      imageUrl: 'https://searchplatform.rospatent.gov.ru${e.url}',
                    ),
                  ))
              .toList()),
    );
  }
}
