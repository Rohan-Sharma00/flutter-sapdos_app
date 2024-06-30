import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/pages/DoctorHomePage.dart';
import 'package:flutter_sapdos_app/sapdos/DoctorPages/presentation/pages/PatientDetailsPage.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/RegistrationPageBloc/RegistrationPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/HomeScreen.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/LoginPage.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/RegistrationPageDoctor.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/RegistrationPagePatient.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/DoctorDetailsPageBloc/DoctorDetailsPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/PatientHomePageBloc/PatientHomePageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/pages/DoctorDetailsPage.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/pages/PatientHomePage.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/pages/PatientPageBookingAppointment.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
        create: (context) => LoginPageBloc(),
        child: MaterialApp.router(
          routerConfig: _router,
        )),
    debugShowCheckedModeBanner: false,
  ));
}

final GoRouter _router = GoRouter(
    initialLocation: '/tp',
  routes: <RouteBase>[
    
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginPage();
          },
        ),
        GoRoute(
          path: 'patientRegistration',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
                create: (context) => RegistrationPageBloc(),
                child: RegistrationPagePatient());
          },
        ),
        GoRoute(
          path: 'doctorRegistration',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
                create: (context) => RegistrationPageBloc(),
                child: RegistrationPageDoctor());
          },
        ),
        GoRoute(
          path: 'patientHome',
          builder: (BuildContext context, GoRouterState state) {
            LoginCredentials obj = state.extra as LoginCredentials;
          
            return BlocProvider(
                create: (context) => PatientHomePageBloc(),
                child: PatientHomePage(loginDetails: obj,));
          },
        ),
        GoRoute(
          path: 'doctor/:id',
          builder: (BuildContext context, GoRouterState state) {
            PersonCredentials obj = state.extra as PersonCredentials;
            return BlocProvider(
                create: (context) => DoctorDetailsPageBloc(),
                child: DoctorDetailsPage(obj));
          },
        ),
        GoRoute(
          path: 'payment',
          builder: (BuildContext context, GoRouterState state) {
            return PatientPageBookingAppointment();
          },
        ),
        GoRoute(
          path: 'doctorHome',
          builder: (BuildContext context, GoRouterState state) {
             LoginCredentials obj = state.extra as LoginCredentials;
          
            return BlocProvider(
                create: (context) => PatientHomePageBloc(),
                child: DoctorHomePage(loginDetails: obj,));
                
          },
        ),
        GoRoute(
          path: 'patient/:id',
          builder: (BuildContext context, GoRouterState state) {
            PersonCredentials obj = state.extra as PersonCredentials;
            return BlocProvider(
                create: (context) => DoctorDetailsPageBloc(),
                child: DoctorDetailsPage(obj));
          },
        ),
          GoRoute(
          path: 'tp',
          builder: (BuildContext context, GoRouterState state) {
            return PatientDetailsPage();
          },
        ),
      ],
    ),
  ],
);
