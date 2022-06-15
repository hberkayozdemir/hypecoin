import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/favlist/presentation/widget/trades_card.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';

class FavListScreen extends StatelessWidget {
  const FavListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme= BlocProvider.of<ThemeCubit>(context);
    bool isDarkMode=theme.isDarkMode;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
body: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      SizedBox(height: 40.h,),
        Text('You Favorite Spots.', style: ThemeStyles.primaryTitleSpots),

        FavListCard(
          color: Color(0xfffe695d),
          letter: 'B',
          title: 'BTC',
          subTitle: 'Bitcoin',
          price: '- 620,30 €',
        ),
        FavListCard(
          color: Color(0xffff0000),
          letter: 'A',
          title: 'AVAX',
          subTitle: 'AVALANCHE',
          price: '- 59,99 €',
        ),

        FavListCard(
          color: Color(0xff103289),
          letter: 'E',
          title: 'ETH',
                subTitle: 'Ethereum',
          price: '- 59,99 €',
        ),

        FavListCard(
          color: Color(0xffaa00ff),
          letter: 'S',
          title: 'SOL',
          subTitle: 'Solana',
          price: '- 59,99 €',
        ),

    ],


  ),
),
      ),
    );
  }
}
