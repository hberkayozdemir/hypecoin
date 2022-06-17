import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/features/treasury/bloc/treasury_bloc.dart';
import 'package:hypecoin/app/features/treasury/transactions/screens/add_transaction.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';
import 'package:hypecoin/app/features/treasury/transactions/widgets/transactionCard.dart';
import 'package:hypecoin/localization/localization.dart';

class RecentTransactions extends StatefulWidget {
  final TreasuryState state;

  const RecentTransactions({super.key, required this.state});

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
                Text(context.localization.recent_transaction,
                    style: ThemeStyles.primaryTitle),

                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AddTransactionScreen()));
                }, child: Center(child: Text("Add Transaction"),))
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: _stateRouter(),
          )
        ],
      ),
    );
  }

  Widget _stateRouter() {
    final state = widget.state;
    if (state is TreasuryLoading) {
      return Center(child: CircularProgressIndicator.adaptive());
    } else if (state is TreasuryLoaded) {
      return ListView.builder(
        padding: EdgeInsets.all(16.r),
        shrinkWrap: true,
        itemCount: state.data.length,
        itemBuilder: (context, i) => TransactionCard(data: state.data[i]),
      );
    } else if (state is TreasuryError) {
      return Center(
        child: Text(
          state.error,
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.red),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
