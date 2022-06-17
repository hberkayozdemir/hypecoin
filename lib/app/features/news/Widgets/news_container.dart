import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/features/editor/models/news.dart';

class NewsContainer extends StatefulWidget {
final News state;
final VoidCallback onPressed;
   NewsContainer({Key? key, required this.state,required this.onPressed}) : super(key: key);

  @override
  _NewsContainerState createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery
        .of(context)
        .platformBrightness == Brightness.dark;
    return GestureDetector(onTap:widget.onPressed ,
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
                  image: NetworkImage(
                      widget.state.image ?? Assets.icons.appLogo.path),
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
                          widget.state.hashtags.toString() ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                    AutoSizeText(
                      widget.state.title ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AutoSizeText(
                      widget.state.content ?? Assets.icons.appLogo.path,
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
