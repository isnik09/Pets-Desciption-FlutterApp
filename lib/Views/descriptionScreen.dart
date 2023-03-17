import 'package:blur_container/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:pets_app_mvvm/Components/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:pets_app_mvvm/Components/myBackButton.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.desc,
      required this.contentUrl});
  final String? title;
  final String? desc;
  final String? contentUrl;
  final String? imageUrl;

  void openBrowser() {
    FlutterWebBrowser.openWebPage(
      url: "$contentUrl",
      customTabsOptions: const CustomTabsOptions(
        colorScheme: CustomTabsColorScheme.dark,
        shareState: CustomTabsShareState.on,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: const SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: Colors.green,
        preferredControlTintColor: Colors.amber,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
      ),
    );
  }

  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(url: "$contentUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyBackButton(),
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                // Image
                AspectRatio(
                  aspectRatio: 2 / 3,
                  child: CachedNetworkImage(
                    imageUrl: '$imageUrl',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Image.asset(
                        'assets/R.jpeg',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // TITLE

                Positioned(
                  bottom: -40,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const BlurContainerWidget(
                        height: 60,
                        width: 6000,
                      ),
                      Text(
                        "$title",
                        style: const TextStyle(
                            fontSize: 30, color: AppColors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),

            // DESCRIPTION

            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Text('$desc',
                  style: const TextStyle(color: AppColors.white, fontSize: 23)),
            ),

            // READ MORE BUTTON

            TextButton(
              onPressed: openBrowser,
              child: const Text(
                "Read More...",
                style: TextStyle(fontSize: 20, color: AppColors.accent),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
