import 'package:blur_container/blur_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pets_app_mvvm/Components/colors.dart';
import 'package:pets_app_mvvm/Utils/Routes/routes.dart';
import 'package:pets_app_mvvm/Views/descriptionScreen.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    required this.imageUrl,
    required this.name,
    required this.onTapFunction,
  });
  final imageUrl;
  final name;
  final onTapFunction;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.black,
      child: Card(
        color: Colors.black,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, progress) {
                return AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Image.asset(
                      'assets/R.jpeg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ));
              },
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                BlurContainerWidget(
                  color: Colors.black.withOpacity(.2),
                  height: 50,
                  width: double.infinity,
                ),
                Text(
                  "$name",
                  style: const TextStyle(fontSize: 20, color: AppColors.white),
                )
              ],
            ),
          ],
        ),
      ),
      onTap: onTapFunction,
    );
  }
}
