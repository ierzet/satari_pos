import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:satari_pos/core/routes.dart';
import 'package:satari_pos/core/util/constant.dart';
import 'package:satari_pos/features/home/presentation/bloc/content_bloc.dart';
import 'package:satari_pos/features/login/presentation/bloc/app_bloc.dart';
import 'package:satari_pos/features/profile/domain/repositories/personal_information_repository.dart';
import 'package:satari_pos/features/profile/presentation/bloc/personal_information_bloc.dart';
import 'package:satari_pos/features/profile/presentation/bloc/profile_navigation_bloc.dart';
import 'package:satari_pos/features/profile/presentation/cubit/gender_radio_cubit.dart';

import 'features/login/data/repositories/authentication_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _authenticationRepository,
        ),
        RepositoryProvider(
          create: (context) => PersonalInformationRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (context) => ContentBloc(),
          ),
          BlocProvider(
            create: (context) => GenderRadioCubit(),
          ),
          BlocProvider(
            create: (context) => PersonalInformationBloc(
                personalInformationRepository:
                    RepositoryProvider.of<PersonalInformationRepository>(
                        context)),
          ),
          BlocProvider(
            create: (context) => ProfileNavBloc(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: thirdColor)),
        primaryColorDark: const Color(0xFF0097A7),
        primaryColorLight: const Color(0xFFB2EBF2),
        //primaryColor: const Color(0xFF00BCD4),
        primaryColor: const Color.fromARGB(255, 212, 138, 0),
        colorScheme: const ColorScheme.light(secondary: Color(0xFF009688)),
        scaffoldBackgroundColor: Colors.white,
        canvasColor: backgroundColor,
        /*inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),*/
      ),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
