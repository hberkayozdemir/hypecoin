import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/features/widgets/drawer_divider.dart';

import 'package:hypecoin/app/features/editor/bloc/editor_bloc.dart';

class EditNewsScreen extends StatelessWidget {
  const EditNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorBloc()..add(GetNewsEvent()),
      child: Scaffold(

          appBar: AppBar(
            title: Text("Delete News"),
          ),
          backgroundColor: Colors.white.withOpacity(0.3),
          body: BlocBuilder<EditorBloc, EditorState>(


            builder: (context, state) {
              return _stateRouter(state,context);
            },
          )),
    );
  }
  Widget _stateRouter(EditorState state,BuildContext context) {

    if (state is EditorLoading) {
      return Center(child: CircularProgressIndicator.adaptive());
    } else if (state is EditorLoaded) {
      return state.data.isEmpty?
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
        itemBuilder: (context, i) => Card(
          color: Colors.white,
          elevation: 2,

          child: ListTile(
            contentPadding: EdgeInsets.all(23.r),
            textColor: Colors.black,
            title:
            Column(
              children: [
                AutoSizeText(state.data[i].id.toString()),
                AutoSizeText(state.data[i].title.toString()),
                AutoSizeText(state.data[i].content.toString()),
                AutoSizeText(state.data[i].image.toString()),
                AutoSizeText(state.data[i].createdAt.toString()),


              ],
            ),
            subtitle: Text(
              state.data[i].hashtags.toString().replaceAll("[", "#").replaceAll(",", "#").replaceAll("]", ""),
            ),
            trailing: IconButton(

              icon: Icon(
                size: 60,
                Icons.remove_circle_rounded,color: Colors.red,),
              onPressed: () {
                context.read<EditorBloc>().add(
                    DeleteNewsEvent(context,
                        newsID: state.data[i].id
                            .toString()));
              },
            ),),
        ),
      );
    } else if (state is EditorError) {
      return Center(
        child: Text(
          state.error,
        )
      );
    } else {
      return SizedBox();
    }
  }



}



