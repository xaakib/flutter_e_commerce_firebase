import 'package:flutter/material.dart';

class ImageSweep extends StatefulWidget {
  final List imageList;

  const ImageSweep({this.imageList});
  @override
  _ImageSweepState createState() => _ImageSweepState();
}

class _ImageSweepState extends State<ImageSweep> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Stack(
          children: [
            PageView(
              onPageChanged: (num) {
                setState(() {
                  _selectedPage = num;
                });
              },
              children: [
                for (var i = 0; i < widget.imageList.length; i++)
                  Container(
                    child: Image.network(
                      "${widget.imageList[i]}",
                      fit: BoxFit.cover,
                    ),
                  )
              ],
            ),
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < widget.imageList.length; i++)
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOutCubic,
                      margin: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      height: 10,
                      width: _selectedPage == i ? 35.0 : 10.0,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
                ],
              ),
            ),
          ],
        ));
  }
}
