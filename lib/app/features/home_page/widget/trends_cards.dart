import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hypecoin/app/features/trades/data/spots_model.dart';

import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';
import 'package:hypecoin/app/core/features/pop_up/dialogs.dart';

class FavlistCard extends StatefulWidget {
  final FavlistModel spot;
  final VoidCallback onpressed;

  FavlistCard({
    required this.onpressed,
    required this.spot,

  });

  @override
  _FavlistCardState createState() => _FavlistCardState();
}

class _FavlistCardState extends State<FavlistCard> {
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
                  onTap: widget.onpressed,
                  child: Icon(
                    Icons.star,
                    color: Colors.pink,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: GestureDetector(

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
                                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.spot.symbol![0].toString(),
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
                                    Text(widget.spot.symbol.toString(),
                                        style: ThemeStyles.otherDetailsPrimary),
                                    Text(widget.spot.currentPrice.toString(),
                                        style:
                                        ThemeStyles.otherDetailsSecondary),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(widget.spot.currentPrice.toString(),
                                    style: TextStyle(color: Colors.green)),
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
