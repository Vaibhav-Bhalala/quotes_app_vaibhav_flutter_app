import 'package:flutter/material.dart';
import 'package:quotes_app/components/utils/quote_list.dart';

import '../model/quotes_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Quotes> Quotedata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Quotedata = QuoteList.map((e) => Quotes.fromMap(Data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Quotedata.map((e) => Card(
                child: Column(
                  children: [
                    Text("${e.quote}"),
                    Text("${e.author}"),
                  ],
                ),
                elevation: 4,
              )).toList(),
        ),
      ),
    );
  }
}
