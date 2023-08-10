import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotes_app/components/utils/quote_list.dart';

import '../components/utils/globals.dart';
import '../model/quotes_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Random random = Random();
  late List<Quotes> Quotedata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Quotedata = QuoteList.map((e) => Quotes.fromMap(Data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    int RandomIndex = random.nextInt(Quotedata.length);
    Quotes quotes = Quotedata[RandomIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Globals.themecolor,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: Text("${quotes.author}"),
                        content: Text("${quotes.quote}"),
                        actions: [
                          OutlinedButton(
                              onPressed: () {}, child: Text("Go back")),
                          OutlinedButton(
                              onPressed: () {}, child: Text("Refresh")),
                        ]),
                  );
                });
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
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
                margin: EdgeInsets.all(50),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.greenAccent,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.dribbble.com/users/3001763/screenshots/6424725/q_dribbble_800x600.gif"),
                        fit: BoxFit.cover)),
              ),
              Column(children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "E-mail",
                      hintStyle: TextStyle()),
                )
              ]),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Quote screen');
                  },
                  child: Text("Log in"))
            ],
          )),
        ],
      ),
    );
  }
}
