import 'dart:math';

import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {
  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  List l2 = [];

  List l1 = [
    "assets/images/dice1.png",
    "assets/images/dice2.png",
    "assets/images/dice3.png",
    "assets/images/dice4.png",
    "assets/images/dice5.png",
    "assets/images/dice6.png"
  ];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dice App"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "enter the number",
                  label: Text("Dice"),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Color(0xFF203A43),
                        style: BorderStyle.solid,
                        width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(),
              child: Center(
                child: InkWell(
                  onTap: () {
                    var rnd = Random();
                    setState(() {
                      //for(i=1;i<=4;i++)
                      i = rnd.nextInt(6);
                    });
                  },
                  child: Image.asset(
                    l1[i],
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
