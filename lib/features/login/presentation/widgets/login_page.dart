import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:satari_pos/features/login/data/repositories/authentication_repository.dart';
import 'package:satari_pos/features/login/presentation/bloc/login_cubit.dart';
import 'package:satari_pos/features/login/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const WelcomeSceeen(),
          Expanded(
            flex: 1,
            child: BlocProvider(
              create: (_) =>
                  LoginCubit(context.read<AuthenticationRepository>()),
              child: const LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeSceeen extends StatelessWidget {
  const WelcomeSceeen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //color: primaryColor,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/LoginScreen.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
