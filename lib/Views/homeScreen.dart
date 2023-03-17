import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pets_app_mvvm/Components/colors.dart';
import 'package:pets_app_mvvm/Components/myCard.dart';
import 'package:pets_app_mvvm/Views/descriptionScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List petsList = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/pets_list.json');
    final data = await json.decode(response);

    setState(() {
      petsList = data["pets"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: petsList.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: petsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyCard(
                      onTapFunction: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DescriptionScreen(
                                    title: petsList[index]['title'],
                                    imageUrl: petsList[index]['image_url'],
                                    desc: petsList[index]['description'],
                                    contentUrl: petsList[index]
                                        ['content_url'])));
                      },
                      imageUrl: petsList[index]['image_url'],
                      name: petsList[index]['title']);
                },
              ),
            )
          : Center(
              child: Image.asset(
                'assets/error.png',
                width: double.infinity,
              ),
            ),
    );
  }
}
