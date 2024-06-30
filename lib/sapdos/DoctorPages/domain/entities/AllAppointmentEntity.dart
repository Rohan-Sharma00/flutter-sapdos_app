class AllAppointmentEntity{
   int pendingAppointment;
  int completedAppointment;
  int totalAppointment;
  List<Patient> patientList;

  AllAppointmentEntity({
    required this.pendingAppointment,
    required this.completedAppointment,
    required this.totalAppointment,
    required this.patientList,
  });

  factory AllAppointmentEntity.fromJson(Map<String, dynamic> json) {
    print("in appointment entity = ${json.toString()}");
    var patientList = json['patientList'] as List;
    List<Patient> patients =
        patientList.map((patientJson) => Patient.fromJson(patientJson)).toList();

    return AllAppointmentEntity(
      pendingAppointment: json['pendingAppointment'],
      completedAppointment: json['completedAppointment'],
      totalAppointment: json['totalAppointment'],
      patientList: patients,
    );
  }

  
  static AllAppointmentEntity getEmptyAppointment() {
  return AllAppointmentEntity(
    pendingAppointment: 0,
    completedAppointment: 0,
    totalAppointment: 0,
    patientList: [],
  );
}

   String toString() {
    return 'Appointment{'
        'pendingAppointment: $pendingAppointment, '
        'completedAppointment: $completedAppointment, '
        'totalAppointment: $totalAppointment, '
        'patientList: $patientList}';
  }
}


class Patient {
  String slotUId;
  String patientUId;
  String name;
  String slotTime;
  bool treated;

  Patient({
    required this.slotUId,
    required this.patientUId,
    required this.name,
    required this.slotTime,
    required this.treated,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      slotUId: json['slotUId'],
      patientUId: json['patientUId'],
      name: json['name'],
      slotTime: json['slotTime'],
      treated: json['treated'],
    );
  }


   String toString() {
    return 'Patient{'
        'slotUId: $slotUId, '
        'patientUId: $patientUId, '
        'name: $name, '
        'slotTime: $slotTime, '
        'treated: $treated}';
  }
}