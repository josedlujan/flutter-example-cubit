import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void emailChanged(value) {
    final isEmailValid = emailValidation(value);
    print('email $value isvalid $isEmailValid');
    emit(state.copyWith(email: value, isEmailValid: isEmailValid));
  }

  void passwordChanged(String value) {
    final isPasswordValid = passwordValidation(value);
    print('password $value isvalid $isPasswordValid');
    emit(state.copyWith(password: value, isPasswordValid: isPasswordValid));
  }

  void loginsubmitted() {
    print(state.email);
    print(state.password);
    if (state.email == 'josedlujan@gmail.com' && state.password == '11111111') {
      emit(state.copyWith(status: LoginStatus.success));
    } else {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }

  bool emailValidation(value) {
    if (value.isNotEmpty && validateEmail(value)) {
      return true;
    }
    return false;
  }

  bool passwordValidation(value) {
    if (value.isNotEmpty && value.length > 7) {
      return true;
    }
    return false;
  }
}

bool validateEmail(String value) {
  bool confirmation = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value);
  return confirmation;
}
