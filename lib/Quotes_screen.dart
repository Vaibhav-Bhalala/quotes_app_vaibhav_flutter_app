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
    bool istoggled = false;

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
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white.withOpacity(0.2),
            onPressed: () {
              setState(() {
                istoggled = !istoggled;
              });
            },
            child: (istoggled) ? Icons.grid_3x3 : Icons.list),
        body: Scrollbar(
          radius: Radius.circular(10),
          interactive: true,
          thickness: 10,
          child: ListView.builder(
              itemCount: Quotedata.length,
              itemBuilder: (BuildContext context, int i) => Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://w0.peakpx.com/wallpaper/573/4/HD-wallpaper-black-ornaments-texture-black-background-floral-ornaments-background-black-texture.jpg"),
                              fit: BoxFit.cover)),
                      alignment: Alignment.center,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${Quotedata[i].quote}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.50)),
                          ),
                          Text(
                            "- ${Quotedata[i].author}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.50)),
                          ),
                        ],
                      ),
                    ),
                  )),
        ));
  }
}
