import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/core/features/appbar/hibemi_appbar.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/trades/bloc/spots_bloc.dart';
import 'package:hypecoin/app/features/trades/widget/trades_card.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';
import 'package:hypecoin/localization/localization.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.appLogo.image(),
            Assets.images.drawerbanner.image(
              height: 80.h,
              width: 200.w,
            ),
          ],
        ),
        hasBackButton: false,
      ),
      body: BlocProvider(
        create: (context) => SpotsBloc()..add(GetSpotsEvent()),
        child: BlocBuilder<SpotsBloc, SpotsState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.localization.hibemi_spot,
                    style: ThemeStyles.primaryTitleSpots),

                _stateRouter(state)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _stateRouter(SpotsState state,) {
    if (state is SpotsLoading) {
      return Center(child: CircularProgressIndicator.adaptive());
    } else if (state is SpotsLoaded) {

      return Flexible(

        child: ListView.builder(
shrinkWrap: true,

          padding: EdgeInsets.all(16.r),

          itemCount: state.data.length,
          itemBuilder: (context, i) =>
              TradesCard(spot: state.data[i],
                  onpressed: () =>  context.read<SpotsBloc>().add(PostSpotsEvent(
                  context, symbol: state.data[i].symbol!,
                  current_price: state.data[i].price!,


              ),
    ),
              ),
        ),

      );
    } else if (state is SpotsError) {
      return Center(
        child: Text(
          state.error,

        ),
      );
    } else {
      return SizedBox();
    }
  }


}
