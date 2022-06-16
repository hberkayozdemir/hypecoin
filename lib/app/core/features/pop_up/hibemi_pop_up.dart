import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypecoin/app/core/features/buttons/rounded_button.dart';
import 'package:rive/rive.dart';

class HibemiPopUp extends StatefulWidget {
  HibemiPopUp(
      {Key? key,
      this.isSuccess = true,
      this.action,
      this.title,
      required this.buttontext,
      required this.description})
      : super(key: key);

  final VoidCallback? action;
  final String? title;
  final String description;
  final String buttontext;
  final bool isSuccess;

  @override
  State<HibemiPopUp> createState() => _HibemiPopUpState();
}

class _HibemiPopUpState extends State<HibemiPopUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack);

    controller
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width - 48.w,
            decoration: ShapeDecoration(
                color: isDarkMode ? Colors.black54 : Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: 28.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => context.router.pop(),
                  child: Padding(
                    padding: EdgeInsets.only(right: 28.h),
                    child: Icon(
                      Icons.transit_enterexit_rounded,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              widget.isSuccess
                  ? RiveAnimation.asset(
                      'assets/videos/success.riv',
                      fit: BoxFit.contain,
                      stateMachines: ['Press'],
                    )
                  : RiveAnimation.asset(
                      'assets/videos/failure.riv',
                      fit: BoxFit.contain,
                      stateMachines: ['Press'],
                    ),
              SizedBox(
                height: 26.6,
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  child: Text(
                    widget.title ?? "",
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black),

                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 8.r),
                child: AutoSizeText(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black),
                  minFontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              RoundedButton(
                height: 46,
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                text: widget.buttontext,
                color: Colors.pink,
                onPressed: () {
                  context.router.pop();
                  if (widget.action != null) widget.action!();
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
