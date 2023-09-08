import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewScreen extends StatefulWidget {
  final List<String> images;

  const ImageViewScreen({Key? key, required this.images}) : super(key: key);

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  TextEditingController descriptionController = TextEditingController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PageView.builder(
                onPageChanged: (index) {
                  _current = index;
                  setState(() {});
                },
                itemCount: widget.images.length,
                itemBuilder: (context, position) {
                  return Center(
                    child: PhotoView(
                      imageProvider: NetworkImage(widget.images[_current]),
                    ),
                  );
                }),
            if (widget.images.length > 1)
              SafeArea(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 25.h),
                  child: DotsIndicator(
                    dotsCount: widget.images.length,
                    position: _current,
                    decorator: DotsDecorator(
                      spacing: const EdgeInsets.only(left: 2.5, right: 2.5),
                      color: ColorUtility.color7A7A7A,
                      activeColor: ColorUtility.color9C5FA3,
                      size: const Size(7.0, 7.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      activeSize: const Size(40.0, 7.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 100,
              child: AppBar(
                  backgroundColor: Colors.black,
                  leading: const BackButton(
                    color: Colors.white,
                  ),
                  elevation: 0,
                  shadowColor: ColorUtility.colorE2E5EF),
            ),
          ],
        ));
  }
}
