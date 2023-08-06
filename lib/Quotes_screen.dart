import 'package:flutter/material.dart';

import 'components/utils/globals.dart';
import 'components/utils/quote_list.dart';
import 'model/quotes_model.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  late List<Quotes> Quotedata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Quotedata = QuoteList.map((e) => Quotes.fromMap(Data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    int count = 1;
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actions: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (route) => false);
                      },
                      child: Text("Yes")),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("No")),
                ],
                content: Text(
                  "Are you sure to Exit???",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Quotes App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Quotedata.map((e) => Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("${count++} : ${e.quote}"),
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
