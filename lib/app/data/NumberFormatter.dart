import 'package:intl/intl.dart';

class NumberFormatter{
  static String currency(int nominal){
    return NumberFormat.currency(
        locale: "id_ID", symbol: "Rp ", decimalDigits: 0).format(
        nominal);
  }
  static String decimal(int number){
    return NumberFormat("#,###").format(number);
  }
}