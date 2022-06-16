

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';

class HibemiAppBar extends StatelessWidget implements PreferredSizeWidget{
   HibemiAppBar({Key? key,  this.title='', this.onBackBtnPressed,  this.height=kToolbarHeight, this.titleImage, this.hasBackButton=true,
   }) : super(key: key);

  final String title;
  final VoidCallback ? onBackBtnPressed;
  final double height;
  final Widget ? titleImage;
  final bool hasBackButton;


  @override
  Widget build(BuildContext context) {
    final theme= BlocProvider.of<ThemeCubit>(context);
    bool isDarkMode=Theme.of(context).brightness==Brightness.dark;

    return Container(
      decoration:  BoxDecoration(
color: isDarkMode? Colors.black:Colors.white
      ),

      child: SafeArea(
        bottom: false,
        child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Align(
                child: Container(height: kToolbarHeight*0.9,
                width: MediaQuery.of(context).size.width*0.8,
                  alignment: Alignment.center,

                child: titleImage??Text(title,textAlign: TextAlign.center,),

                ),


              ),
              hasBackButton?
              Visibility(
                  visible: hasBackButton,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.r),
                    child: GestureDetector(
                        child: Icon(Icons.arrow_back_outlined,color: Colors.purple,),
                        onTap: onBackBtnPressed==null?()=>Navigator.of(context).pop():()=>onBackBtnPressed?.call()
                    ),
                  ))
                  :



              Padding(
                padding: EdgeInsets.only(left: 25.r),
                child: GestureDetector(
                    child: Icon(Icons.list,color: Colors.purple,),
                    onTap: ()=>Scaffold.of(context).openDrawer()
                ),
              )

        ]),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}





class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.titleImage}) : super(key: key);

  final String title;

  final Widget titleImage;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

