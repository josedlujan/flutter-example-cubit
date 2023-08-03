import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_example/presentation/blocs/login/cubit/login_cubit.dart';
import 'package:form_example/presentation/screens/home.dart';
import 'package:form_example/routes/custom_material_page_router.dart';
import 'package:form_example/presentation/widgets/customformtextfield.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey();
  LoginScreen({super.key, required this.title});
  final String title;
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    final email = loginCubit.state.email;
    final emailError = loginCubit.state.isEmailValid;
    final passwordError = loginCubit.state.isPasswordValid;

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            CustomFormTextField(
              label: 'Email',
              errorText: emailError ? null : 'Error',
              onChanged: (value) {
                loginCubit.emailChanged(value);
              },
              validator: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormTextField(
              obscureText: true,
              label: 'Enter your password',
              errorText: passwordError ? null : 'Error',
              onChanged: (value) {
                loginCubit.passwordChanged(value);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  loginCubit.loginsubmitted();
                  if (emailError && passwordError) {
                    Navigator.push(
                      context,
                      CustomMaterialPageRouter(builder: (context) => Home()),
                    );
                  }
                },
                child: const Text('Login')),
          ]),
        ),
      ),
    );
  }
}
