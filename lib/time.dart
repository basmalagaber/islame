import 'package:flutter/material.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Image.asset(
            "assets/images/time1.png",
            width: size.width*.9,
            height: size.height*.23,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: size.height*.02,left: size.width*.02),
            child: Text("Azkar",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height*.02,horizontal: size.width*.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff202020),
                  border: Border.all(color: Color(0xffE2BE7F),width: 2)
                ),
                height: size.height*.30,
                width: size.width*.45,
                child: Column(
                  children: [
                    Image.asset("assets/images/time2.png"),
                    SizedBox(height: 20,),
                    Text("Evening Azkar",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height*.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff202020),
                    border: Border.all(color: Color(0xffE2BE7F),width: 2)
                ),
                height: size.height*.30,
                width: size.width*.45,
                child:  Column(
                  children: [
                    Image.asset("assets/images/time3.png"),
                    SizedBox(height: 20,),
                    Text("Morning Azkar",style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
