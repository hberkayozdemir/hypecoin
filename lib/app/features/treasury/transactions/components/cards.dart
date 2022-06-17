import 'package:flutter/material.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeColors.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';
import 'package:hypecoin/app/features/treasury/transactions/widgets/creditCard.dart';
import 'package:hypecoin/localization/localization.dart';

class CardsList extends StatefulWidget {
final num money;

  const CardsList({super.key, required this.money});


  @override
  _CardsListState createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {





  int _currentCard = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentCard = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List cardList = [
      CreditCard(money: widget.money, ),
    ];
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 32.0, left: 15.0, right: 15.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.localization.your_account, style: ThemeStyles.primaryTitle),
              ],
            ),
          ),
          Container(
            height: 246.0,
            child: PageView.builder(
              itemCount: cardList.length,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) => CreditCard(money: widget.money),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < cardList.length; i++)
                  if (_currentCard == i)
                    DotIndicator(true)
                  else
                    DotIndicator(false)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DotIndicator extends StatefulWidget {
  final bool isActive;

  DotIndicator(this.isActive);

  @override
  _DotIndicatorState createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: widget.isActive ? ThemeColors.black : ThemeColors.grey,
        ),
      ),
    );
  }
}
