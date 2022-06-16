import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_managers/flutter_managers.dart';
import 'package:hypecoin/app/core/constants/network_path.dart';
import 'package:hypecoin/app/core/constants/string_constants.dart';
import 'package:hypecoin/app/core/features/toast/toast_message.dart';
import 'package:hypecoin/app/core/models/user_model.dart';
import 'package:hypecoin/app/features/session/verification/verification.dart';
import 'package:hypecoin/localization/localization.dart';
import 'package:hypecoin/routes/app_router.dart';
import 'package:load/load.dart';

import '../../../core/services/client/client_service.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final _manager = ClientService.instance.manager;

  SessionBloc() : super(SessionState()) {
    on<LoginEvent>(_login);
    on<RegisterEvent>(_register);
    on<SplashControlEvent>(_splashControl);
    on<OtpEvent>(_otp);
    on<LogOutEvent>(_logout);
  }
  Future<void> _login(LoginEvent event, Emitter<SessionState> emit) async {
    try {
      await showLoadingDialog();

      final response = await _manager.postRequest<User, User>(
        NetworkPath.login,
        parseModel: User(),
        body: {
          'email': event.email,
          'password': event.password,
        },
      );

      if (response.data != null) {
        await CacheManager.saveModel(response.data!);
        toastMessage(
          event.context.localization.login_success,
          type: ToasType.success,
        );

        event.context.router.pushAndPopUntil(LandingMainRoute(), predicate: (router) => false);
      } else {
        toastMessage(
          response.error?.message ?? 'Error',
          type: ToasType.error,
        );
      }
    } catch (e) {
      toastMessage(
        e.toString(),
        type: ToasType.error,
      );
    } finally {
      hideLoadingDialog();
    }
  }

  Future<void> _register(RegisterEvent event, Emitter<SessionState> emit) async {
    try {
      await showLoadingDialog();

      final response = await _manager.postRequest<User, User>(
        NetworkPath.register,
        parseModel: User(),
        body: {
          'firstName': event.firstName,
          'lastName': event.lastName,
          'phone': event.phone,
          'email': event.email,
          'password': event.password,
        },
      );

      if (response.error?.statusCode == 201) {
        event.context.router.pushWidget(VerificationScreen(email: event.email!));
      } else {
        toastMessage(
          response.error?.statusCode != null ? response.error!.statusCode.toString() : 'Error',
          type: ToasType.error,
        );
      }
    } catch (e) {
      toastMessage(
        e.toString(),
        type: ToasType.error,
      );
    } finally {
      hideLoadingDialog();
    }
  }

  Future<void> _otp(OtpEvent event, Emitter<SessionState> emit) async {
    try {
      await showLoadingDialog();

      final response = await _manager.postRequest<User, User>(
        NetworkPath.usersActive,
        parseModel: User(),
        body: {
          'email': event.email,
          'code': event.code,
        },
      );

      if (response.data != null) {
        await CacheManager.saveModel(response.data!);

        toastMessage(
          event.context.localization.login_success,
          type: ToasType.success,
        );

        event.context.router.pushAndPopUntil(LandingMainRoute(), predicate: (router) => false);
      } else {
        toastMessage(
          response.error?.message ?? 'Error',
          type: ToasType.error,
        );
      }
    } catch (e) {
      toastMessage(
        e.toString(),
        type: ToasType.error,
      );
    } finally {
      hideLoadingDialog();
    }
  }

  Future<void> _logout(LogOutEvent event, Emitter<SessionState> emit) async {
    try {
      await showLoadingDialog();

      await CacheManager.remove(User().runtimeType.toString());

      event.context.router.pushAndPopUntil(LoginRoute(), predicate: (router) => false);
    } catch (e) {
      toastMessage(e.toString(), type: ToasType.error);
    } finally {
      hideLoadingDialog();
    }
  }

  void _splashControl(SplashControlEvent event, Emitter<SessionState> emit) async {
    final getStartedActive = CacheManager.getBool(StringConstant.getStartedActive);
    if (!(getStartedActive == true)) {
      await CacheManager.saveBool(StringConstant.getStartedActive, true);
    }

    event.context.router.pushAndPopUntil(
      CacheManager.getModel(User()) != null ? LandingMainRoute() : (getStartedActive == true ? LoginRoute() : GetStartedRoute()),
      predicate: (router) => false,
    );
  }
}
