import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  bool _isPlaying = false;

  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      Assets.images.drawerbanner.image(fit: BoxFit.fitWidth),
      Assets.images.banner1.image(fit: BoxFit.fitWidth),
      Assets.images.banner2.image(fit: BoxFit.fitWidth),
      Assets.images.banner3.image(fit: BoxFit.fitWidth),
    ];
    return Container(
      height: 160,
      child: CarouselSlider.builder(
        unlimitedMode: true,
        controller: _sliderController,
        slideBuilder: (index) {
          return items[index];
        },
        slideTransform: CubeTransform(),
        slideIndicator: CircularSlideIndicator(
          padding: EdgeInsets.only(bottom: 12),
          indicatorBackgroundColor: Colors.white,
          alignment: Alignment.bottomCenter,
          indicatorBorderColor: Colors.purple,
        ),
        itemCount: items.length,
        enableAutoSlider: true,
      ),
    );
  }
}
