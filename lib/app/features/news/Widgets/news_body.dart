import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hypecoin/app/core/features/widgets/drawer_divider.dart';
import 'package:hypecoin/app/features/news/Widgets/news_container.dart';
import 'package:hypecoin/app/features/news/bloc/seperated_news_bloc.dart';
import 'package:hypecoin/app/features/news/screens/news_detail_screen.dart';


import 'package:hypecoin/localization/localization.dart';

class NewsBodyScreen extends StatefulWidget {

  @override
  _NewsBodyScreenState createState() => _NewsBodyScreenState();
}

class _NewsBodyScreenState extends State<NewsBodyScreen> {



  @override
  void initState() {
  context.read<SeperatedNewsBloc>()..add(GetNewsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme
        .of(context)
        .brightness == Brightness.dark;


    return BlocProvider(
      create: (context) =>
      SeperatedNewsBloc()
        ..add(GetNewsEvent()),
      child: BlocBuilder<SeperatedNewsBloc, SeperatedNewsState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.all(2),
            children: [


              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  context.localization.for_you,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _stateRouter(state, context),
            ],
          );
        },
      ),
    );
  }

  Widget _stateRouter(SeperatedNewsState state, BuildContext context) {
    if (state is SeperatedNewsLoading) {
      return Center(child: CircularProgressIndicator.adaptive(),);
    } else if (state is SeperatedNewsLoaded) {
      return state.data.isEmpty ?
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText("There is no new in app"),
          Center(child: CircularProgressIndicator.adaptive(),),
        ],
      )
          : ListView.separated(

        separatorBuilder: ((context, index) => DrawerDivider()),

        padding: EdgeInsets.all(16.r),
        shrinkWrap: true,
        itemCount: state.data.length,
        itemBuilder: (context, i) =>
            NewsContainer(state: state.data[i],

              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: ((context) =>
                    NewsDetailScreen(state: state.data[i])
                ))
                );
              },
            )
        ,

      );
    } else if (state is SeperatedNewsError) {
      return Center(
          child: Text(
            state.error,style: TextStyle(color: Colors.white,fontSize: 32),
          )
      );
    } else {
      return SizedBox();
    }
  }


}