import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';
import 'package:hypecoin/app/core/features/pop_up/dialogs.dart';

class TradesCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final String price;
  final String letter;
  final Color color;

  TradesCard({
    required this.color,
    required this.letter,
    required this.price,
    required this.subTitle,
    required this.title,
  });

  @override
  _TradesCardState createState() => _TradesCardState();
}

class _TradesCardState extends State<TradesCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  child: Icon(
                    Icons.star_border_purple500,
                    color: Colors.pink,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: GestureDetector(
                  onTap: () => popUpMessage(
                    context,
                   "asdasd",
                      "sad",
                      useRootNavigator: true,
                      buttonText: "Geç",
                      dismissable: false,
                      ),
                  child: Container(
                    height: 50.0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 44.0,
                                  width: 44.0,
                                  decoration: BoxDecoration(
                                    color: widget.color,
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.letter,
                                      style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.title,
                                        style: ThemeStyles.otherDetailsPrimary),
                                    Text(widget.subTitle,
                                        style:
                                            ThemeStyles.otherDetailsSecondary),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(widget.price,
                                    style: TextStyle(color: Colors.red)),
                                SizedBox(width: 4.0),
                                Icon(Icons.keyboard_arrow_right),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.5),
          thickness: 0.5,
          endIndent: 10.0,
          indent: 10.0,
        ),
      ],
    );
  }
}
