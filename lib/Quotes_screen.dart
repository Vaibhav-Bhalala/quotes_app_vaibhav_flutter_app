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
  bool istoggled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Quotedata = QuoteList.map((e) => Quotes.fromMap(Data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    int count = 1;

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
          child:
              Icon((istoggled == true) ? Icons.grid_3x3_rounded : Icons.list),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://st4.depositphotos.com/4790623/24384/i/450/depositphotos_243842048-stock-photo-red-sunset-and-moon-beautiful.jpg"),
                      fit: BoxFit.cover)),
            ),
            (istoggled == true)
                ? ListView.builder(
                    itemCount: Quotedata.length,
                    itemBuilder: (BuildContext context, int i) => Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pinkAccent,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://img.freepik.com/premium-photo/3d-rendering-dark-geometric-background-copy-space-advertising-product-display_733139-845.jpg"),
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
                                      color: Colors.white.withOpacity(0.65)),
                                ),
                                Text(
                                  "- ${Quotedata[i].author}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.75)),
                                ),
                              ],
                            ),
                          ),
                        ))
                : Scrollbar(
                    radius: Radius.circular(10),
                    interactive: true,
                    thickness: 10,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                      ),
                      itemBuilder: (BuildContext Context, int i) => Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pinkAccent,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://img.freepik.com/premium-photo/3d-rendering-dark-geometric-background-copy-space-advertising-product-display_733139-845.jpg"),
                                fit: BoxFit.cover)),
                        alignment: Alignment.center,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 100,
                              child: Text(
                                "${Quotedata[i].quote}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.65)),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Text(
                              "- ${Quotedata[i].author}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.75)),
                            ),
                          ],
                        ),
                      ),
                    ))
          ],
        ));
  }
}
