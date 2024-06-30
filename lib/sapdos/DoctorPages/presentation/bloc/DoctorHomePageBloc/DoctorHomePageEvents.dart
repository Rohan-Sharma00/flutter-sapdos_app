import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';

class DoctorHomePageEvents{

}

class DoctorHomePageInitialEvent extends DoctorHomePageEvents {
 final LoginCredentials credentails;
 DoctorHomePageInitialEvent({required this.credentails});
}

