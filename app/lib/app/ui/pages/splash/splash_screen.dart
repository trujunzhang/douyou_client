import 'package:flutter/material.dart';
import 'package:dy_getx/app/data/const/app_images.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageContainer = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.bgSplash),
          fit: BoxFit.contain,
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.only(bottom: 80.0),
      color: Colors.white,
      child: Center(
        child: SizedBox(
          width: 344,
          height: 345,
          child: imageContainer,
        ),
      ),
    );
  }
}
