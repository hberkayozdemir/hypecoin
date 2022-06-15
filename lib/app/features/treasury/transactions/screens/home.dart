
import 'package:flutter/material.dart';
import 'package:hypecoin/app/features/treasury/transactions/components/cards.dart';
import 'package:hypecoin/app/features/treasury/transactions/components/recentTransactions.dart';

class TradesHomeScreen extends StatefulWidget {
  @override
  _TradesHomeScreenState createState() => _TradesHomeScreenState();
}

class _TradesHomeScreenState extends State<TradesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            CardsList(),
            RecentTransactions(),
          ],
        ),
      ),
    );
  }
}
