import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hadith_mode.dart';

class SuraDetailes extends StatefulWidget {
  static const String routeName = "SuraDetailes";
  List<String> verses=[];
   SuraDetailes({super.key});

  @override
  State<SuraDetailes> createState() => _SuraDetailesState();
}

class _SuraDetailesState extends State<SuraDetailes> {
  @override
  Widget build(BuildContext context) {
    var sura = ModalRoute.of(context)?.settings.arguments as List;
    String suraNameA = sura[0];
    String suraNameE = sura[1];
    int indexSura = sura[2];
    if(widget.verses.isEmpty){
      loadSuraFile(indexSura);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xffE2BE7F),
        ),
        title: Text(
          suraNameE,
          style: TextStyle(
              color: Color(0xffE2BE7F),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/details_bg.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Text(
                    suraNameA,
                    style: TextStyle(
                        color: Color(0xffE2BE7F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 44,),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 14,),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffE2BE7F)),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text.rich(
                            textAlign:TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text:"${widget.verses[index]}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              TextSpan(
                                text:"(${index +1 })",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ]
                          )
                        ),
                      )

                    );

                  },
                    itemCount: widget.verses.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String file = await rootBundle.loadString("assets/files/${index + 1 }.txt");
    List<String> lines = file.split("\n");
    widget.verses=lines;
    setState(() {});
  }
}
