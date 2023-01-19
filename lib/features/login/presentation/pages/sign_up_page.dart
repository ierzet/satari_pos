import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satari_pos/features/login/data/repositories/authentication_repository.dart';

import 'package:satari_pos/features/login/presentation/bloc/sign_up_cubit.dart';
import 'package:satari_pos/features/login/presentation/pages/view.dart';
import 'package:satari_pos/features/login/presentation/widgets/login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const WelcomeSceeen(),
          Expanded(
            flex: 1,
            child: BlocProvider<SignUpCubit>(
              create: (_) =>
                  SignUpCubit(context.read<AuthenticationRepository>()),
              child: const SignUpForm(),
            ),
          ),
        ],
      ),
    );
  }
}
