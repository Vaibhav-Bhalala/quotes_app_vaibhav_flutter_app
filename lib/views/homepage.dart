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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'Quote screen');
              },
              child: Text("See More"))
        ],
      )),
    );
  }
}
