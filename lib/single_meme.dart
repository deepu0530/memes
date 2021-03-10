
import 'package:flutter/material.dart';
import 'package:memes/all_memes.dart';


class SingleMeme extends StatefulWidget {
  SingleMeme({
    this.url,
  });

  final String url;

  @override
  _SingleMemeState createState() => _SingleMemeState();
}

class _SingleMemeState extends State<SingleMeme> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 20,bottom: 160),
              child: InkWell(
                onTap: (){
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AllMemes(),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.greenAccent,
                  ),
                    child:  Center(child: Image(
                      image: AssetImage("assets/images/cross.png"),
                      width: 12,
                      height: 12,
                    ),),
                ),
              ),
            ),
            Center(
              child: InteractiveViewer(
                minScale: 0.7,
                maxScale: 2,
                child:  Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("${widget.url}"),fit: BoxFit.cover,
                      )
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
