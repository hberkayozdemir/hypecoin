import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/core/features/appbar/hibemi_appbar.dart';
import 'package:hypecoin/app/core/features/banner/view/banner.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/home_page/widget/trends_cards.dart';
import 'package:hypecoin/app/features/trades/bloc/spots_bloc.dart';
import 'package:hypecoin/app/features/trades/widget/trades_card.dart';
import 'package:hypecoin/app/features/treasury/models/treasury_model.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';
import 'package:hypecoin/app/features/treasury/transactions/widgets/otherDetailsDivider.dart';
import 'package:hypecoin/app/features/treasury/transactions/widgets/transactionCard.dart';
import 'package:hypecoin/localization/localization.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context);
    bool isDarkMode = theme.isDarkMode;

    return Scaffold(
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
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => SpotsBloc()..add(GetTrendsEvent()),
          child: BlocBuilder<SpotsBloc, SpotsState>(
            builder: (context, state) {
              return SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      BannerWidget(),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(context.localization.new_trends,
                                style: ThemeStyles.primaryTitle),


                          ],
                        ),
                      ),
                      _stateRouter(state)
                    ],
                  ));
            },
          ),
        ));
  }


  Widget _stateRouter(SpotsState state,) {
    if (state is FavListLoading) {
      return Center(child: CircularProgressIndicator.adaptive());
    } else if (state is FavListLoaded) {
      return Flexible(

        child: ListView.builder(
          shrinkWrap: true,

          padding: EdgeInsets.all(16.r),

          itemCount: state.data.length,
          itemBuilder: (context, i) =>
              FavlistCard(spot: state.data[i],
                onpressed: () =>
                    context.read<SpotsBloc>().add(PostSpotsEvent(
                      context, symbol: state.data[i].symbol!,
                      current_price: state.data[i].currentPrice!,


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
