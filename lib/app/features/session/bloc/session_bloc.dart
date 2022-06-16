import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_managers/flutter_managers.dart';
import 'package:hypecoin/app/core/constants/network_path.dart';
import 'package:hypecoin/app/core/features/toast/toast_message.dart';
import 'package:hypecoin/app/core/models/user_model.dart';
import 'package:hypecoin/localization/localization.dart';
import 'package:hypecoin/routes/app_router.dart';
import 'package:load/load.dart';

import '../../../core/services/client/client_service.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final _manager = ClientService.instance.manager;
  final BuildContext context;
  SessionBloc(this.context) : super(SessionState()) {
    on<LoginEvent>(_login);
    on<RegisterEvent>(_register);
    on<SessionEvent>(_session);
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
          context.localization.login_success,
          type: ToasType.success,
        );

        context.router.pushAndPopUntil(LandingMainRoute(), predicate: (router) => false);
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
          'email': event.email,
          'password': event.password,
        },
      );

      if (response.data != null) {
        await CacheManager.saveModel(response.data!);
        toastMessage(
          context.localization.registration_success,
          type: ToasType.success,
        );

        context.router.pushAndPopUntil(LandingMainRoute(), predicate: (router) => false);
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

  Future<void> _otp(RegisterEvent event, Emitter<SessionState> emit) async {}

  Future<void> _logout(RegisterEvent event, Emitter<SessionState> emit) async {}

  Future<void> _session(SessionEvent event, Emitter<SessionState> emit) async {}
}
