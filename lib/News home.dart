import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_paper_project/Model/News.dart';
import 'package:news_paper_project/Model/blank.dart';
import 'package:news_paper_project/Services/Remote%20Service.dart';

import 'Details.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({super.key});

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  Comment? comment;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    print("Fetching data...");
    comment = await RemoteService().getNews();

    if (comment != null) {
      setState(() {
        isLoaded = true;
      });
    } else {
      print("Error: No data received");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Daily Star",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: comment!.articles?.length ?? 0,
        itemBuilder: (_, index) {
          return Card(
            elevation: 2,
            child: InkWell(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailsPage(comment!.articles[index])),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    comment!.articles![index].urlToImage ??
                        'https://www.spxdaily.com/images-hg/us-senate-wing-capitol-dome-washington-hg.jpg',
                    height: 140,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 5, left: 8),
                    child: Text(
                      comment!.articles![index].title ?? 'No Title',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 5, left: 8),
                    child: Text(
                      comment!.articles![index].author ?? "Unknown Author",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // Show loader if not loaded
    );
  }
}
