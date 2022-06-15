import 'package:flutter/material.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/features/news/Screens/ArticleScreen.dart';

import 'package:hypecoin/app/features/news/data/article.dart';

class TrendingContainer extends StatefulWidget {
  final Article article;

  const TrendingContainer({Key? key, required this.article}) : super(key: key);

  @override
  _TrendingContainerState createState() => _TrendingContainerState();
}

class _TrendingContainerState extends State<TrendingContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ArticleScreen(
                    article: widget.article,
                  )));
        },
        child: Container(
          margin: const EdgeInsets.only(right: 15),
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          widget.article.image ?? Assets.icons.appLogo.path),
                    )),
              ),
              Container(
                width: 180,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: Colors.black38,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.article.author ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "ds",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
