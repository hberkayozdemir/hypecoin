import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/treasury/transactions/components/cards.dart';
import 'package:hypecoin/app/features/treasury/transactions/components/recentTransactions.dart';
import 'package:hypecoin/app/features/treasury/transactions/screens/home.dart';

class TreasuryScreen extends StatelessWidget {
  const TreasuryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context);
    bool isDarkMode = theme.isDarkMode;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: CardsList(),
          ),
          RecentTransactions(),
        ],
      ),
    );
  }
}
