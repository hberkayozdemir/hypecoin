import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';
import 'package:hypecoin/app/features/treasury/transactions/widgets/transactionCard.dart';
import 'package:hypecoin/localization/localization.dart';

class RecentTransactions extends StatefulWidget {
  @override
  _RecentTransactionsState createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              bottom: 16.0,
              top: 32.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.localization.recent_transaction, style: ThemeStyles.primaryTitle),

              ],
            ),
          ),

        Flexible(
              flex: 1,
              child: ListView(
           padding:  EdgeInsets.all(16.r),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  TransactionCard(
                    color: Colors.black,
                    letter: 'F',
                    title: 'Fintory GmbH',
                    subTitle: 'Finance Landing Page',
                    price: '- 5.720,30 €',
                  ),
                  TransactionCard(
                    color: Color(0xfffe695d),
                    letter: 'D',
                    title: 'Domink Schmidit',
                    subTitle: 'Mykonos Hotel Booking',
                    price: '- 620,30 €',
                  ),
                  TransactionCard(
                    color: Color(0xff103289),
                    letter: 'E',
                    title: 'Evolt.io',
                    subTitle: 'Evolt UI Kit',
                    price: '- 59,99 €',
                  ),
                  TransactionCard(
                    color: Colors.greenAccent,
                    letter: 'F',
                    title: 'Fintory GmbH',
                    subTitle: 'Finance Landing Page',
                    price: '- 5.720,30 €',
                  ),
                  TransactionCard(
                    color: Colors.amberAccent,
                    letter: 'E',
                    title: 'Evolt.io',
                    subTitle: 'Evolt UI Kit',
                    price: '- 59,99 €',
                  ),
                ],

            ),
          )
        ],
      ),
    );
  }
}
