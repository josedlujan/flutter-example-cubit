import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_example/presentation/blocs/login/cubit/login_cubit.dart';

import 'package:form_example/presentation/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: MaterialApp(
        title: 'Login Screen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(title: 'Login Demo'),
      ),
    );
  }
}
