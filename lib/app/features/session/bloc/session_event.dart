part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends SessionEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class RegisterEvent extends SessionEvent {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? password;

  RegisterEvent({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
  });
}
