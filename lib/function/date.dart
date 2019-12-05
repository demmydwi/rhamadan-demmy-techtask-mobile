import 'package:intl/intl.dart' as intl;

intl.DateFormat apiFormat = intl.DateFormat("yyyy-MM-dd");
intl.DateFormat userFormat = intl.DateFormat("dd MMM yyyy");

String formattedDateFromApi(String apiDate){
  DateTime apiDateTime = apiFormat.parse(apiDate);
  return userFormat.format(apiDateTime);
}