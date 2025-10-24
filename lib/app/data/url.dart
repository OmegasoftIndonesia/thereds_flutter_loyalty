import 'package:thereds_flutter_loyalty/app/data/Constants.dart';

class URLAPI{

  static String devProd =
  (Constants.dbTestingName == "omegacloudtesting6")
      ? "api-dev"
      : "api-prod";
  static String newDev =
  (Constants.dbTestingName == "omegacloudtesting6")
      ? "apidev"
      : "apinew";
  static String baseURL="https://api-prod.omegasoft.co.id/v1/";

  static String loginOTP2 = "$baseURL${newDev}/LoginOTPNoTT";
  static String sendOTP = "${baseURL}wa/sendOTP";
  static String validateOTP = "${baseURL}wa/validateOTP";
  static String insertCust = "$baseURL${newDev}/insertCust";
  static String getKodePelanggan = "$baseURL${newDev}/getKodePelanggan";
  static String listNotifikasi = "$baseURL${newDev}/ListNotifikasi";
  static String promo = "http://bo.idekuliner.com/api/promo";
  static String setCustProfile = "$baseURL${newDev}/setCustProfile";
  static String getGameList = "$baseURL${newDev}/getGameList";
  static String getMemberLevel = "$baseURL${newDev}/getMemberLevel";
  static String getPaketByRentObject = "$baseURL${newDev}/getPaketByRentObject";
  static String ListRentObject = "$baseURL${newDev}/ListRentObject";
  static String getRoomSchedule = "$baseURL${newDev}/getRoomSchedule";
  static String createGopay = "https://api-prod.omegasoft.co.id/v3/payment/gopay/transaction";
  static String getGopay = "https://api-prod.omegasoft.co.id/v3/payment/gopay/gettransaction";
  static String insertpiutangdraftso = "$baseURL${newDev}/insertpiutangdraftso";
  static String ListHistoryPointWithDepositSO = "$baseURL${newDev}/ListHistoryPointWithDepositSO";
  static String about = "$baseURL${newDev}/about";
  static String cart2 = "$baseURL${newDev}/cart2";
  static String approvedraftso = "$baseURL${newDev}/approvedraftso";
  static String ListHistoryDepositWithDepositSO = "$baseURL${newDev}/ListHistoryDepositWithDepositSO";
  static String getGameListByRentObject = "$baseURL${newDev}/getGameListByRentObject";
  static String paymenttype = "$baseURL${newDev}/paymenttype";
  static String getlistorder = "$baseURL${newDev}/getlistorder";
  static String detail_listorder = "$baseURL${newDev}/detail_listorder";
}