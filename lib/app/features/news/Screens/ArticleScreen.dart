import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/features/news/data/article.dart';

class ArticleScreen extends StatefulWidget {
  final Article article;

  const ArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(widget.article.image ??
                              Assets.images.banner1.path),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Icon(
                        Icons.more_vert,
                        size: 40,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.article.category ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.article.time ?? "",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.article.title ?? "",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            widget.article.authorImg ??
                                Assets.images.banner1.path,
                            height: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.article.description ?? "",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
//                      fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          context.router.pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
