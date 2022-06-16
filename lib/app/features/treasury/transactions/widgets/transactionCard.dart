import 'package:flutter/material.dart';
import 'package:hypecoin/app/features/treasury/models/treasury_model.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';

class TransactionCard extends StatefulWidget {
  final TreasuryModel data;

  TransactionCard({
    required this.data,
  });

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.0,
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
                      color: Colors.pinkAccent.shade700,
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Center(
                      child: Text(
                        widget.data.symbol?.substring(0, 1).toUpperCase() ?? '',
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
                      Text(widget.data.symbol ?? "", style: ThemeStyles.otherDetailsPrimary),
                      Text(widget.data.userId ?? '', style: ThemeStyles.otherDetailsSecondary),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.data.buyingPrice != null ? widget.data.buyingPrice.toString() : "",
                    style: TextStyle(
                      color: widget.data.transactionType == 'buy' ? Colors.greenAccent.shade700 : Colors.red,
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Icon(Icons.keyboard_arrow_right),
                ],
              )
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 0.5,
            indent: 16.0,
          ),
        ],
      ),
    );
  }
}
