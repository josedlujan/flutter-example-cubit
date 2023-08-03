part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String email;
  final bool isEmailValid;
  final String password;
  final bool isPasswordValid;
  final LoginStatus status;

  const LoginState({
    this.email = '',
    this.isEmailValid = true,
    this.password = '',
    this.isPasswordValid = true,
    this.status = LoginStatus.error,
  });

  factory LoginState.initial() {
    return LoginState(email: '', password: '', status: LoginStatus.initial);
  }

  LoginState copyWith({
    String? email,
    bool? isEmailValid,
    String? password,
    bool? isPasswordValid,
    LoginStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
