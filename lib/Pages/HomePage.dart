import 'package:dachnews/Pages/Category.dart';
import 'package:dachnews/Services/API.dart';
import 'package:dachnews/Services/UrlLuncher.dart';
import 'package:flutter/material.dart';
import 'package:dachnews/constant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  API apiNews = API();
  UrlLuncher luncher = UrlLuncher();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.whiteblue,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 20),
            child: Text(
              "Choose News Categories",
              style: TextStyle(fontSize: Constant.biggertext),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CategoryPage(catigory: "general");
                        },
                      ));
                    },
                    color: Constant.blue,
                    child: Text(
                      "General",
                      style: TextStyle(
                          color: Constant.black,
                          fontSize: Constant.subtitletext),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CategoryPage(catigory: "science");
                        },
                      ));
                    },
                    color: Constant.yellow,
                    child: Text(
                      "Science",
                      style: TextStyle(
                          color: Constant.black,
                          fontSize: Constant.subtitletext),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CategoryPage(catigory: "health");
                        },
                      ));
                    },
                    color: Constant.red,
                    child: Text(
                      "Health",
                      style: TextStyle(
                          color: Constant.black,
                          fontSize: Constant.subtitletext),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CategoryPage(catigory: "business");
                        },
                      ));
                    },
                    color: Constant.whitegreen,
                    child: Text(
                      "Business",
                      style: TextStyle(
                          color: Constant.black,
                          fontSize: Constant.subtitletext),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CategoryPage(catigory: "sports");
                        },
                      ));
                    },
                    color: Constant.orange,
                    child: Text(
                      "Sports",
                      style: TextStyle(
                          color: Constant.black,
                          fontSize: Constant.subtitletext),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CategoryPage(catigory: "entertainment");
                        },
                      ));
                    },
                    color: Constant.blue,
                    child: Text(
                      "Entertainment",
                      style: TextStyle(
                          color: Constant.black,
                          fontSize: Constant.subtitletext),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 20),
                child: Text(
                  "Best News:",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: Constant.largetext),
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8),
            child: FutureBuilder(
              future: apiNews.fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Constant.blue,
                      valueColor: AlwaysStoppedAnimation(Constant.red),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Image picIsNull() {
                        if (snapshot.data[index].urlToImage == null) {
                          return Image.asset(
                            "assets/notfound.jpg",
                            fit: BoxFit.fitWidth,
                          );
                        } else {
                          return Image.network(
                            snapshot.data[index].urlToImage,
                            fit: BoxFit.fitWidth,
                          );
                        }
                      }

                      return GestureDetector(
                        onTap: () {
                          luncher.lunch(snapshot.data[index].url);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Container(child: picIsNull()),
                              Container(
                                padding: EdgeInsets.all(3),
                                child: Text(
                                  snapshot.data[index].title,
                                  style: TextStyle(
                                      fontSize: Constant.subtitletext),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ))
        ],
      ),
    );
  }
}
