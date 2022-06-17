part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends SessionEvent {
  final BuildContext context;
  final String email;
  final String password;

  LoginEvent(
    this.context,
    this.email,
    this.password,
  );
}

class SplashControlEvent extends SessionEvent {
  final BuildContext context;

  SplashControlEvent(
    this.context,
  );
}

class LogOutEvent extends SessionEvent {
  final BuildContext context;

  LogOutEvent(this.context);
}

class OtpEvent extends SessionEvent {
  final BuildContext context;
  final String email;
  final String code;

  OtpEvent(this.context, this.email, this.code);
}

class RegisterEvent extends SessionEvent {
  final BuildContext context;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? password;

  RegisterEvent(
    this.context, {
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
  });
}



class RegisterEditorEvent extends SessionEvent {
  final BuildContext context;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? password;

  RegisterEditorEvent(
      this.context, {
        required this.firstName,
        required this.lastName,
        required this.phone,
        required this.email,
        required this.password,
      });
}



