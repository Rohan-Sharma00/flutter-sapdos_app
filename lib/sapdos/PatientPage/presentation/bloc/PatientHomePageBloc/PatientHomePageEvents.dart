import 'package:flutter_sapdos_app/sapdos/utils/LoginCredentials.dart';

class PatientHomePageEvents{

}

class PatientHomePageInitialEvent extends PatientHomePageEvents {
 final LoginCredentials credentails;
 PatientHomePageInitialEvent({required this.credentails});
}