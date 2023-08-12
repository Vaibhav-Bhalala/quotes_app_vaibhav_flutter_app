import 'package:flutter/material.dart';
import 'package:quotes_app/components/utils/globals.dart';
import 'package:quotes_app/model/quotes_model.dart';

class Detail_screen extends StatefulWidget {
  const Detail_screen({super.key});

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen> {
  @override
  Widget build(BuildContext context) {
    Quotes data = ModalRoute.of(context)!.settings.arguments as Quotes;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.80),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Quotes App"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://w0.peakpx.com/wallpaper/895/512/HD-wallpaper-mountain-river-rocks-forest-summer-mountain-landscape-environment-ecology.jpg"),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(35),
                  height: 375,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 10,
                          color: Colors.grey)
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${data.quote}",style: TextStyle(fontSize: 20,),),
                        Text("${data.author}")
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
