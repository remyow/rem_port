import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ScrollAnimationPage()));

class ScrollAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollAnimation(),
    );
  }
}

class ScrollAnimation extends StatefulWidget {
  @override
  _ScrollAnimationState createState() => _ScrollAnimationState();
}

class _ScrollAnimationState extends State<ScrollAnimation> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double _calculateImageScale() {
    double scale = 1 - (_scrollOffset / 300);
    return scale.clamp(0.5, 1.0);
  }

  double _calculateImageTranslation() {
    return (_scrollOffset * 0.5).clamp(0, 200);
  }

  @override
  Widget build(BuildContext context) {
    final imageHeight = 250.0;

    return Stack(
      children: [
        Positioned(
          top: -_calculateImageTranslation(),
          left: 0,
          right: 0,
          child: Transform.scale(
            scale: _calculateImageScale(),
            alignment: Alignment.center,
            child: Container(
              height: imageHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/your_image.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: imageHeight,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Your Title"),
                background: Container(), // The image is handled by the Stack
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (_, index) => ListTile(
                  title: Text("Item $index"),
                ),
                childCount: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
