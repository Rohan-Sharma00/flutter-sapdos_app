import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/bloc/LoginPageBloc/LoginPageBloc.dart';
import 'package:flutter_sapdos_app/sapdos/LoginPages/presentation/pages/LoginPage.dart';


class DoctorSideBar extends StatelessWidget {
  var data = [
    {"icon": "category_outlined", "text": "Categories"},
    {"icon": "calendar_today", "text": "Appointment"},
    {"icon": "forum", "text": "Chat"},
    {"icon": "settings", "text": "Setting"},
    {"icon": "logout", "text": "Logout"}
  ];

  final Map<String, IconData> iconDataMap = {
    'category_outlined': Icons.category_outlined,
    'calendar_today': Icons.calendar_today,
    'forum': Icons.forum,
    'settings': Icons.settings,
    'logout': Icons.logout,
  };

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Center(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: InkWell(
                    onTap: () {
                      if (data[index]['text'] == 'Logout') {
                         Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return BlocProvider(
                              create: (context) => LoginPageBloc(),
                              child: LoginPage(),
                            );
                          }));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(iconDataMap[data[index]['icon']],
                            color: Colors.white, size: 30),
                        SizedBox(width: 8),
                        Text(
                          data[index]['text'] ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
