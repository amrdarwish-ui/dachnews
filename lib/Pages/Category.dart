import 'package:dachnews/Services/API.dart';
import 'package:dachnews/Services/UrlLuncher.dart';
import 'package:flutter/material.dart';
import 'package:dachnews/constant.dart';

class CategoryPage extends StatefulWidget {
  String catigory;
  CategoryPage({Key key, @required this.catigory}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState(catigory: catigory);
}

class _CategoryPageState extends State<CategoryPage> {
  String catigory;
  _CategoryPageState({@required this.catigory});
  API apiCategories = API();
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 20),
                child: Text(
                  "$catigory:",
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
              future: apiCategories.fetchCategories(catigory),
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
