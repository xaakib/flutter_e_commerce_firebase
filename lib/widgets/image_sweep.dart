import 'package:flutter/material.dart';

class ImageSweep extends StatefulWidget {
  final List imageList;

  const ImageSweep({this.imageList});
  @override
  _ImageSweepState createState() => _ImageSweepState();
}

class _ImageSweepState extends State<ImageSweep> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Stack(
          children: [
            PageView(
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
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      height: 12,
                      width: 15,
                      color: Colors.white,
                    ),
                ],
              ),
            ),
          ],
        ));
  }
}
