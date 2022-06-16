import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/features/news/Screens/ArticleScreen.dart';
import 'package:hypecoin/app/features/news/data/article.dart';

class ForYouContainer extends StatefulWidget {
  final Article article;

  const ForYouContainer({Key? key, required this.article}) : super(key: key);

  @override
  _ForYouContainerState createState() => _ForYouContainerState();
}

class _ForYouContainerState extends State<ForYouContainer> {

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery
        .of(context)
        .platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ArticleScreen(
                  article: widget.article,
                )));
      },
      child: Container(


        margin: EdgeInsets.symmetric(vertical: 20.r, horizontal: 10.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xff191628),
            boxShadow: [
              BoxShadow(
                color: !isDarkMode ? Colors.white:Colors.black,
                blurRadius: 0,
                spreadRadius: 0,
                offset: Offset(0, 0.5),
              )
            ]),
        child: Row(
          children: [
            Container(
              width: 90.h,
              height: 90.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),

                ),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                      widget.article.image ?? Assets.icons.appLogo.path),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          widget.article.category ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AutoSizeText(
                          widget.article.time ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    AutoSizeText(
                      widget.article.title ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AutoSizeText(
                      widget.article.author ?? Assets.icons.appLogo.path,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
