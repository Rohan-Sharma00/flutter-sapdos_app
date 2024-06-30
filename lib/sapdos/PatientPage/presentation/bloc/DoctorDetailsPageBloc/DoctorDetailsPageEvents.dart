import 'package:flutter_sapdos_app/sapdos/utils/PersonCredentials.dart';

class DoctorDetailsPageEvents{

}

class DoctorDetailsPageInitialEvent extends DoctorDetailsPageEvents {
 
}

class DoctorDetailsPageSlotsEvent extends DoctorDetailsPageEvents {
final String id;
DoctorDetailsPageSlotsEvent(this.id);
}