import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/treasury/bloc/treasury_bloc.dart';
import 'package:hypecoin/app/features/treasury/transactions/components/cards.dart';
import 'package:hypecoin/app/features/treasury/transactions/components/recentTransactions.dart';

class TreasuryScreen extends StatelessWidget {
  const TreasuryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context);
    bool isDarkMode = theme.isDarkMode;

    return BlocProvider(
      create: (context) => TreasuryBloc()..add(GetTreasuryEvent()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<TreasuryBloc, TreasuryState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: CardsList(),
                ),
                RecentTransactions(state: state),
              ],
            );
          },
        ),
      ),
    );
  }
}
