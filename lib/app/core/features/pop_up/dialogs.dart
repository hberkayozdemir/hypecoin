import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:hypecoin/app/core/features/pop_up/hibemi_pop_up.dart';


void popUpMessage(
    BuildContext context,
    String? title,
    String description, {
      required String buttonText,
      VoidCallback? action,
      bool dismissable = true,
      bool useRootNavigator = false,
    }) {
  showDialog<void>(
    context: context,
    barrierDismissible: dismissable,
    useRootNavigator: useRootNavigator,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => dismissable,
        child: HibemiPopUp(
          action: action,
          title: title,
          description: description,
          buttontext: buttonText,
        ),
      );
    },
  );
}

