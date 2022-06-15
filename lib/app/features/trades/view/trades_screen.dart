import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/core/features/appbar/hibemi_appbar.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/trades/widget/trades_card.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';

class TradesScreen extends StatelessWidget {
  const TradesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context);
    bool isDarkMode = theme.isDarkMode;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HibemiAppBar(
        titleImage: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Assets.icons.appLogo.image(),
          ],
        ),
        hasBackButton: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hibemi Spots.', style: ThemeStyles.primaryTitleSpots),
          Material(
            elevation: 5,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: 'Search...',
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          TradesCard(
            color: Color(0xfffe695d),
            letter: 'B',
            title: 'BTC',
            subTitle: 'Bitcoin',
            price: '- 620,30 €',
          ),
          TradesCard(
            color: Color(0xffff0000),
            letter: 'A',
            title: 'AVAX',
            subTitle: 'AVALANCHE',
            price: '- 59,99 €',
          ),
          TradesCard(
            color: Color(0xff103289),
            letter: 'E',
            title: 'ETH',
            subTitle: 'Ethereum',
            price: '- 59,99 €',
          ),
          TradesCard(
            color: Color(0xffaa00ff),
            letter: 'S',
            title: 'SOL',
            subTitle: 'Solana',
            price: '- 59,99 €',
          ),
        ],
      ),
    );
  }
}
