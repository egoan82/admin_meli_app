import 'package:flutter/material.dart';

import '../../../../utils/responsive.dart';

class ImagesProduct extends StatefulWidget {
  const ImagesProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<ImagesProduct> createState() => _ImagesProductState();
}

class _ImagesProductState extends State<ImagesProduct> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive(context);
    return SizedBox(
      height: size.hp(20),
      child: PageView.builder(
        controller: _pageController,
        itemCount: 6,
        pageSnapping: true,
        itemBuilder: (context, index) {
          const List<String> images = [
            'https://http2.mlstatic.com/D_658390-MCO51956098654_102022-O.jpg',
            'https://http2.mlstatic.com/D_797966-MCO51956098656_102022-O.jpg',
            'https://http2.mlstatic.com/D_625252-MCO51956098655_102022-O.jpg',
            'https://http2.mlstatic.com/D_749151-MCO51956098658_102022-O.jpg',
            'https://http2.mlstatic.com/D_703106-MCO51956098657_102022-O.jpg',
            'https://http2.mlstatic.com/D_976573-MCO51956098659_102022-O.jpg',
          ];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.network(
              images[index],
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
