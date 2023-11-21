import 'package:pm_t1_flutter_client/models/students-data-model.dart';

String destructPersonEnumStatus(dynamic status) {
  switch(status) {
    case IsActive.ACTIVE:
      return 'Aktif';
      break;
    case IsActive.DROP_OUT:
      return 'Drop Out';
      break;
    case IsActive.NON_ACTIVE:
      return 'Tidak Aktif';
      break;
    default:
      return 'Undefined';
  }
}

String destructPersonEnumFaculty(dynamic faculty) {
  switch(faculty) {
    case Faculty.COMPUTER_SCIENCE:
      return 'FASILKOM-TI';
      break;
    default:
      return 'Undefined';
  }
}
String destructPersonEnumMajor(dynamic major) {
  switch(major) {
    case Faculty.INFORMATION_TECHNOLOGY:
      return 'Teknologi Informasi';
      break;
    default:
      return 'Undefined';
  }
}
