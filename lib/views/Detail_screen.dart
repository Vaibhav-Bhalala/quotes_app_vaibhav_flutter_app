import 'package:flutter/material.dart';
import 'package:quotes_app/components/utils/globals.dart';

class Detail_screen extends StatefulWidget {
  const Detail_screen({super.key});

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen> {
  @override
  Widget build(BuildContext context) {
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
                      BoxShadow(offset: Offset(0, 5), blurRadius: 10)
                    ],
                    color: Colors.white,
                  ),
                  child: Column(children: []),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
