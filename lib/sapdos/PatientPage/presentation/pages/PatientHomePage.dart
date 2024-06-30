import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_sapdos_app/sapdos/PatientPage/data/data_sources/ApiServicePatient.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/PatientHomePageBloc/PatientHomePageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/PatientHomePageBloc/PatientHomePageEvents.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/bloc/PatientHomePageBloc/PatientHomePageStates.dart';
import 'package:flutter_sapdos_app/sapdos/PatientPage/presentation/widgets/widgets.dart';

import 'package:flutter_sapdos_app/sapdos/utils/Constants.dart';
import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';
import 'package:flutter_sapdos_app/sapdos/utils/SapdosSideBar.dart';
import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class PatientHomePage extends StatelessWidget {
  LoginCredentials loginDetails = new LoginCredentials();
  PersonCredentials credentials = PersonCredentials.emptyObj();

  PatientHomePage({required this.loginDetails});

  Future<dynamic> _loadJsonData() async {
    String url = Constants.baseUrl + Constants.getAllDoctorUrl;
    ApiServicePatient apiService = new ApiServicePatient(url: url, body: "");
    final response = apiService.executeApiGet();
    return response;
  }

  Row firstContainer() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello !",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              Text(
                "${credentials.name}",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 50),
              ),
            ],
          ),
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(
                'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
          )
        ]);
  }

  Container BlueLine() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF13235A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 100),
              child: Row(
                children: [
                  Text(
                    "Doctor's List",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xffDCE0ED),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(Icons.filter_list,
                    size: 20, color: const Color(0xff13235A)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    print(
        "in patient home page logincredentials = ${loginDetails.id} = ${loginDetails.role}");
    return BlocProvider(
      create:(context) => PatientHomePageBloc()
        ..add(PatientHomePageInitialEvent(credentails: loginDetails)),
      child: BlocBuilder<PatientHomePageBloc, PatientHomePageStates>(
          builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorState) {
          return Center(
              child: Text(
            state.message,
            style: TextStyle(
              color: state.textColor,
              fontSize: 20,
            ),
          ));
        } else if (state is PatientHomePageInitialSuccessState) {
          credentials = state.person;
          List<PersonCredentials> allData = state.credentials;
          return Container(child: MainPage(context, allData));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  BlocProvider MainPage(BuildContext context, List<PersonCredentials> allData) {
    return BlocProvider(
      create: (context) => PatientHomePageBloc(),
      child: Scaffold(
          body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Color(0xFF13235A),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20, top: 20),
                            child: Text(
                              "SAPDOS",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: Colors.white, fontSize: 60),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FractionallySizedBox(
                            widthFactor: 0.8,
                            child: Center(child: DoctorSideBar()),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Expanded(
                            child: Column(children: [
                          FractionallySizedBox(
                              widthFactor: 0.85, child: firstContainer()),
                          SizedBox(height: 20),
                          SizedBox(height: 20),
                          FractionallySizedBox(
                              widthFactor: 0.85, child: BlueLine()),
                          SizedBox(height: 15),
                          Expanded(
                            child: FractionallySizedBox(
                                widthFactor: 0.85,
                                child: DoctorDetails(context, allData)),
                          ),
                        ]))))
              ]))),
    );
  }
}
