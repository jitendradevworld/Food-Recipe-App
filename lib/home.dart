// ignore_for_file: prefer_const_constructors
/*
https://api.edamam.com/search?q=chicken&app_id=22514d8c&app_key=2d5f2a815a6ac2cd6fc218261818271e&from=0&to=3&calories=591-722&health=alcohol-free
*/
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();

  getRecipe(String query) async {
    String url =
        "https://api.edamam.com/search?q=$query&app_id=22514d8c&app_key=2d5f2a815a6ac2cd6fc218261818271e&from=0&to=3&calories=591-722&health=alcohol-free";
    Response response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("###########################");
    getRecipe("ladoo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: const [Color(0xff213A50), Color(0xff071938)])),
          ),
          Column(
            children: [
              //Search Bar
              SafeArea(
                child: Container(
                  //Search Wala Container

                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll(" ", "") ==
                              "") {
                            // print("Blank search");
                          } else {
                            getRecipe(searchController.text);
                          }
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Let's Cook Something!"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "WHAT DO YOU WANT TO COOK TODAY?",
                      style: TextStyle(color: Colors.white, fontSize: 33),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Let's cook something new",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
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
