import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hadith_detailes.dart';
import 'hadith_mode.dart';
import 'my_theme.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (allAhadeth.isEmpty) {
      return Center(child: Text("No Hadiths available."));
    }

    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              autoPlay: false,
              enlargeCenterPage: true,
            ),
            items: allAhadeth.map((hadeth) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetailsScreen.routeName,
                      arguments: hadeth);
                },
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      "assets/images/hadeth_bg.png",
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            hadeth.title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: MyThemeData.blackColor),
                          ),
                        ),
                        SizedBox(height: 32),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              hadeth.content.first,
                              textAlign: TextAlign.center,
                              maxLines: 13,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: MyThemeData.blackColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 18),
      ],
    );
  }

  void loadHadethFile() async {
    try {
      String file = await rootBundle.loadString("assets/files/ahadeth.txt");
      List<String> ahadeth = file.split("#");
      allAhadeth = ahadeth.map((data) {
        List<String> lines = data.trim().split("\n");
        String title = lines.first;
        lines.removeAt(0);
        return HadethModel(title, lines);
      }).toList();
    } catch (error) {
      print("Error Details: $error");
      // Optionally show error to the user
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
