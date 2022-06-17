

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeColors.dart';
import 'package:hypecoin/app/features/treasury/transactions/utilities/themeStyles.dart';

class CreditCard extends StatefulWidget {
  final num money;

  const CreditCard({super.key,  this.money=0});
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override


  Widget build(BuildContext context) {
    bool isDarkMode=Theme.of(context).brightness==Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 216.h,
        width: 380.w,
        decoration: BoxDecoration(
          color: isDarkMode? Colors.white:ThemeColors.black,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Assets.icons.appLogo.image(height: 55),
                    Text(widget.money <=0 ? '-${widget.money} \$':'+${widget.money} \$', style: ThemeStyles.cardMoney.copyWith(color: widget.money <=0 ?  Colors.red:Colors.greenAccent.shade700)),
                Assets.images.drawerbanner.image(width: 130),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  bottom: 32.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hilmi Berkay Özdemir', style: ThemeStyles.cardDetails.copyWith(color: isDarkMode?Colors.black: Colors.white)),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Text('4756', style: ThemeStyles.cardDetails.copyWith(color: isDarkMode?Colors.black: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Assets.icons.cardDots.svg(width: 50),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Assets.icons.cardDots.svg(width: 50),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text('9018', style: ThemeStyles.cardDetails.copyWith(color: isDarkMode?Colors.black: Colors.white)),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
