import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypecoin/app/features/admin/bloc/admin_bloc.dart';

class Staticals extends StatelessWidget {
  const Staticals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AdminBloc()
        ..add(GetAdminStaticsEvent()),

      child: Scaffold(
          appBar: AppBar(
            title: Text("Admin Istatistics"),
          ),

          backgroundColor: Colors.black38.withOpacity(0.3),

          body: BlocBuilder<AdminBloc, AdminState>(
            builder: (context, state) {


              return state is AdminLoading?
              Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text("Yükleniyor",style: TextStyle(color: Colors.grey),),
                  CircularProgressIndicator.adaptive(),
                ],
              ))
              : state is AdminLoaded?
                  state.data!=null?
              ListView(

                children: [
                  ListTile(

                    title: Text("User Count, Kullanıcı Sayısı="),
                    subtitle: Text(state.data.codesCount.toString(),)
                  ),
                  ListTile(
                      title: Text("Coins Count, Coin Sayısı="),
                      subtitle: Text(state.data.coinsCount.toString(),)
                  ),
                  ListTile(
                      title: Text("User who has been add coin favlist Count,Favliste ekleme olusturan kullanıcı sayısı="),
                      subtitle: Text(state.data.favListCount.toString(),)
                  ),
                  ListTile(
                      title: Text("News Count, Haber Sayısı="),
                      subtitle: Text(state.data.newsCount.toString(),)
                  ),
                  ListTile(
                      title: Text("Spots Count, Spottaki coin Sayısı="),
                      subtitle: Text(state.data.spotsCount.toString(),)
                  ),


                ],
              )
                  :Container()

              : Icon(Icons.error);
            },
          )
      ),
    );
  }
}
