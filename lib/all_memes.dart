import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memes/memes_data.dart';
import 'package:memes/single_meme.dart';

class AllMemes extends StatefulWidget {
  @override
  _AllMemesState createState() => _AllMemesState();
}

class _AllMemesState extends State<AllMemes> {
  List<MemesData> listTodos = List();

  bool _fetching = true;

  void getHttp() async {
    setState(() {
      _fetching = true;
    });
    try {
      Response response =
      await Dio().get("https://namo-memes.herokuapp.com/memes/page/0/30");
      setState(() {
        listTodos = memesDataFromJson(jsonEncode(response.data));
        _fetching = false;
      });
    } catch (e) {
      setState(() {
        _fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text(
            "Meme",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:
            3),
            itemCount: listTodos.length,
            itemBuilder: (BuildContext context,int index){
              MemesData todo = listTodos[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      SingleMeme(
                        url:"${todo.url}",
                      ),
                  ),);
                },
                    child:Padding(
                      padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("${todo.url}"),fit: BoxFit.cover,
                            )
                        ),
                      ),
                    )

              ) ;
            }
        ),
    );
  }}
