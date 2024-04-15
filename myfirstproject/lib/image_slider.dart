import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<dynamic> imageLists;
  ImageSlider({required this.imageLists});
  @override
  State<ImageSlider> createState() => _ImageSlider();
}

class _ImageSlider extends State<ImageSlider> {
  final CarouselController imageSlider = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
              items: widget.imageLists
                  .map(
                    (dynamic item) => Image.asset(
                      item['image_path'],
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                  )
                  .toList(),
              carouselController: imageSlider,
              options: CarouselOptions(
                  scrollPhysics: BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: .5,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
        ),
        Positioned(
          top: 470,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imageLists.asMap().entries.map((entry) {
              print(entry);
              print(entry.key);
              return GestureDetector(
                onTap: () => imageSlider.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 9 : 7,
                  height: 7.0,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: currentIndex == entry.key
                          ? const Color.fromARGB(255, 105, 105, 105)
                          : Colors.white),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
