import 'dart:math';

import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  List l1 = [
    "assets/images/dice1.png",
    "assets/images/dice2.png",
    "assets/images/dice3.png",
    "assets/images/dice4.png",
    "assets/images/dice5.png",
    "assets/images/dice6.png",
  ];

  List l2 = [];
  List l3 = [];
  int i = 0, n = 0, y = 0, z = 0, b = 0;
  TextEditingController txtno = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Dice app",
                style: TextStyle(fontSize: 25, color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.black),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: txtno,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2)),
                    label: Text(
                      "Enter the no",
                      style: TextStyle(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87))),
                style: TextStyle(color: Colors.black87),
              ),
              InkWell(
                onTap: () {
                  String a = txtno.text;
                  n = int.parse(a);
                  l3.clear();
                  l2.clear();
                  setState(() {
                    l2.length = n;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Colors.blue.shade700, width: 2)),
                    child: Text("Creat",
                        style: TextStyle(
                            color: Colors.white, fontSize: 25)),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: l2
                      .asMap()
                      .entries
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              l1[l3.isEmpty ? 0 : l3[e.key]],
                              height: 100,
                              width: 100,
                            ),
                          ))
                      .toList(),
                ),
              ),
              InkWell(
                onTap: () {
                  l3.clear();
                  setState(() {
                    var rnd = Random();
                    b = l2.length;
                    for (y = 0; y < n; y++) {
                      z = rnd.nextInt(6);
                      b = b + z;
                      l3.add(z);
                      print(b);
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Colors.blue.shade700, width: 2)),
                    child: Text("Play",
                        style: TextStyle(
                            color: Colors.white, fontSize: 25)),
                  ),
                ),
              ),
              Container(
                width: 550,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade700, width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sum all dice",
                        style: TextStyle(
                            color: Colors.white, fontSize: 25)),
                    Text("$b",
                        style: TextStyle(
                            color: Colors.white, fontSize: 25)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
