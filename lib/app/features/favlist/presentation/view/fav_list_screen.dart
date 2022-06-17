import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/favlist/presentation/widget/trades_card.dart';
import 'package:hypecoin/app/features/home_page/widget/trends_cards.dart';
import 'package:hypecoin/app/features/trades/bloc/spots_bloc.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';
import 'package:hypecoin/localization/localization.dart';

class FavListScreen extends StatelessWidget {
  const FavListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context);
    bool isDarkMode = theme.isDarkMode;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 40.h,),
              Text(context.localization.your_favorite_spots,
                  style: ThemeStyles.primaryTitleSpots),


              BlocProvider(
                create: (context) => SpotsBloc()..add(GetFavlistEvent()),
                child: BlocBuilder<SpotsBloc, SpotsState>(
                  builder: (context, state) {
                    return _stateRouter(state);
                  },
                ),
              )


            ],


          ),
        ),
      ),
    );
  }

  Widget _stateRouter(SpotsState state) {
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
