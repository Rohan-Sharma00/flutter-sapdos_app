class Constants {
  static const String baseUrl = "https://sapdos-api-v2.azurewebsites.net/api/";
  static const String loginUrl = "Credentials/Login";
  static const String registerUrl = "Credentials/Register";
  static const String getAllDoctorUrl = "Patient/GetAllUser?Role=doctor";
  static const String getDoctorByID = "Doctor/GetDoctorByUId?DoctorUId=";
    static const String getPatientByID = "Patient/GetPatientByUId?PatientUId=";
   static const String getDoctorDashboard = "Doctor/GetDoctorDashbord?DoctorUId=";
  static const String userName = 'userName';
  static const String password = 'password';
  static const String doctorImageUrl =
      "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250";
  static const String getAvailableSlots = "Patient/GetAvailbleSlot?";

  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Host': 'sapdos-api-v2.azurewebsites.net',
  };
}
