import 'package:flutter/material.dart';
import 'package:zoya/models/news.dart';
import 'package:zoya/screens/recommended/recommended_products.dart';
import 'package:zoya/screens/views/read_article_view.dart';
import 'package:zoya/shared/primary_card.dart';
import 'package:zoya/shared/secondary_card.dart';
import 'package:zoya/shared/title_with_more_bbtn.dart';

import '../../constants.dart';

class FeaturedArticleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TitleWithMoreBtn(title: "Featured",),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.only(left: 18.0),
            child: ListView.builder(
              itemCount: popularList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var news = popularList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadArticleView(news: news),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 12.0),
                    child: PrimaryCard(news: news),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TitleWithMoreBtn(title: "Recommended",),
          RecommendProducts(),
          SizedBox(height: 15.0),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19.0),
              child: Text("BASED ON YOUR READING HISTORY",
                  style: kNonActiveTabStyle),
            ),
          ),
          ListView.builder(
            itemCount: recentList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              var recent = recentList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadArticleView(news: recent),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: SecondaryCard(news: recent),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}