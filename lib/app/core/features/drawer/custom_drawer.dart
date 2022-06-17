import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_managers/flutter_managers.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';
import 'package:hypecoin/app/core/features/widgets/drawer_divider.dart';
import 'package:hypecoin/app/core/models/user_model.dart';
import 'package:hypecoin/app/core/theme/cubit/theme_cubit.dart';
import 'package:hypecoin/app/features/admin/manage/register_editor.dart';
import 'package:hypecoin/app/features/admin/staticals/view/staticals.dart';
import 'package:hypecoin/app/features/editor/add_news/add_news.dart';
import 'package:hypecoin/app/features/editor/edit_news/edit_news.dart';
import 'package:hypecoin/app/features/session/bloc/session_bloc.dart';
import 'package:hypecoin/localization/bloc/localization_bloc.dart';
import 'package:hypecoin/localization/i10n.dart';
import 'package:hypecoin/localization/localization.dart';
import 'package:hypecoin/localization/provider/localization_helper.dart';

class CustomDrawer extends StatefulWidget {
  final String userType;

  CustomDrawer({Key? key, required this.userType}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<L10n> selectedLocale = ValueNotifier(L10n.get(currentLocale));
    final theme = BlocProvider.of<ThemeCubit>(context);
    final dark = theme.isDarkMode;
    final String usertype=CacheManager.getModel(User())!.userType!;

    return Drawer(
      elevation: 4,
      backgroundColor: dark ? Colors.black : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: dark
                ? Assets.images.drawerbanner.image(
                    height: 100.h,
                  )
                : Assets.icons.appLogo.image(
                    height: 100.h,
                    width: 300.w,
                  ),
          ),
          SizedBox(
            height: 20.h,
          ),
          AutoSizeText(
            "${context.localization.welcome}, $usertype ",
            style: TextStyle(color: dark ? Colors.white : Colors.black),
          ),
          SizedBox(
            height: 20.h,
          ),
          DrawerDivider(),
          SizedBox(
            height: 10.h,
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  context.localization.about_us,
                  style: TextStyle(color: dark ? Colors.white : Colors.black),
                )),
                Expanded(
                    child: Icon(
                  Icons.info,
                  color: Colors.purple.shade900,
                )),
              ],
            ),
          ),
          DrawerDivider(),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Text(
                  context.localization.whats_app_live_support,
                  style: TextStyle(color: dark ? Colors.white : Colors.black),
                )),
                Expanded(
                    child: Icon(
                  Icons.whatsapp,
                  color: Colors.purple.shade900,
                )),
              ],
            ),
          ),
          _editorPerms(usertype=="editor", dark),
          _adminPerms(usertype=="admin", dark,context),
          SizedBox(height: 40.h,),

          Padding(
            padding: EdgeInsets.all(12),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      context.localization.language,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: dark ? Colors.white : Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: FlutterSwitch(
                      width: 100.0,
                      height: 50.0,
                      toggleSize: 45.0,
                      value: context.localization.selected_language == "en",
                      borderRadius: 30.0,
                      padding: 2.0,
                      activeToggleColor: Colors.white,
                      inactiveToggleColor: Colors.white,
                      activeSwitchBorder: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                      inactiveSwitchBorder: Border.all(
                        color: Color(0xFFD1D5DA),
                        width: 6.0,
                      ),
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      inactiveIcon: CircleAvatar(backgroundColor: Colors.transparent, radius: 40, child: Assets.icons.turkey.svg()),
                      activeIcon: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        child: Assets.icons.english.svg(fit: BoxFit.contain),
                      ),
                      onToggle: (va) {
                        setState(() {
                          if (va) {
                            updateLanguage(context, selectedLocale, L10n.enUS);
                          } else {
                            updateLanguage(context, selectedLocale, L10n.tr);
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      selectedLocale.value.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: dark ? Colors.white : Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      context.localization.theme,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: dark ? Colors.white : Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: FlutterSwitch(
                        width: 100.0,
                        height: 50.0,
                        toggleSize: 50.0,
                        value: theme.isDarkMode,
                        borderRadius: 30.0,
                        padding: 2.0,
                        activeToggleColor: Color(0xFF6E40C9),
                        inactiveToggleColor: Color(0xFF2F363D),
                        activeSwitchBorder: Border.all(
                          color: Color(0xFF3C1E70),
                          width: 6.0,
                        ),
                        inactiveSwitchBorder: Border.all(
                          color: Color(0xFFD1D5DA),
                          width: 6.0,
                        ),
                        activeColor: Color(0xFF271052),
                        inactiveColor: Colors.white,
                        activeIcon: Icon(
                          Icons.nightlight_round,
                          color: Color(0xFFF8E3A1),
                        ),
                        inactiveIcon: Icon(
                          Icons.wb_sunny,
                          color: Color(0xFFFFDF5D),
                        ),
                        onToggle: (va) {
                          setState(() {
                            if (va) {
                              theme.changeTheme();
                            } else {
                              theme.changeTheme();
                            }
                          });
                        }),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      theme.isDarkMode == true ? context.localization.dark_mode : context.localization.light_mode,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: dark ? Colors.white : Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Center(
            child: TextButton(
                onPressed: () => context.read<SessionBloc>().add(LogOutEvent(context)),
                child: Text(
                  'Log out',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.redAccent),
                )),
          )
        ],
      ),
    );
  }

  Widget _editorPerms(bool isEditor, bool dark) {
    return Visibility(
        visible: isEditor,
        child: Column(
          children: [
            DrawerDivider(),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewsScreen() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    context.localization.add_news,
                    style: TextStyle(color: dark ? Colors.white : Colors.black),
                  )),
                  Expanded(
                      child: Icon(
                    Icons.newspaper,
                    color: Colors.purple.shade900,
                  )),
                ],
              ),
            ),
            DrawerDivider(),
            TextButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context)=> EditNewsScreen() ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    context.localization.edit_news,
                    style: TextStyle(color: dark ? Colors.white : Colors.black),
                  )),
                  Expanded(
                      child: Icon(
                    Icons.newspaper_sharp,
                    color: Colors.purple.shade900,
                  )),
                ],
              ),
            ),
            DrawerDivider(),

          ],
        ));
  }

  Widget _adminPerms(bool isAdmin, bool dark,BuildContext context) {
    return Visibility(
        visible: isAdmin,
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ManageEditorScreen() ));

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    context.localization.manage_user,
                    style: TextStyle(color: dark ? Colors.white : Colors.black),
                  )),
                  Expanded(
                      child: Icon(
                    Icons.edit_off_outlined,
                    color: Colors.purple.shade900,
                  )),
                ],
              ),
            ),
            DrawerDivider(),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Staticals() ));

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    context.localization.staticals,
                    style: TextStyle(color: dark ? Colors.white : Colors.black),
                  )),
                  Expanded(
                      child: Icon(
                    Icons.analytics,
                    color: Colors.purple.shade900,
                  )),
                ],
              ),
            ),
            DrawerDivider(),
          ],
        ));
  }
}

void updateLanguage(BuildContext context, ValueNotifier<L10n> selectedLocale, L10n newSelection) {
  selectedLocale.value = newSelection;
  context.read<LocalizationsBloc>().add(ChangeLocale(selectedLocale.value.getLocale()));
}
