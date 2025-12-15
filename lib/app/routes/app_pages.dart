import 'package:get/get.dart';

import '../modules/booking/bindings/booking_binding.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/bookingHistory/bindings/booking_history_binding.dart';
import '../modules/bookingHistory/views/booking_history_view.dart';
import '../modules/detailNotif/bindings/detail_notif_binding.dart';
import '../modules/detailNotif/views/detail_notif_view.dart';
import '../modules/gamelist/bindings/gamelist_binding.dart';
import '../modules/gamelist/views/gamelist_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/membershippoint/bindings/membershippoint_binding.dart';
import '../modules/membershippoint/views/membershippoint_view.dart';
import '../modules/newspromotion/bindings/newspromotion_binding.dart';
import '../modules/newspromotion/views/newspromotion_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/paymentsuccess/bindings/paymentsuccess_binding.dart';
import '../modules/paymentsuccess/views/paymentsuccess_view.dart';
import '../modules/pointhistory/bindings/pointhistory_binding.dart';
import '../modules/pointhistory/views/pointhistory_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/qris/bindings/qris_binding.dart';
import '../modules/qris/views/qris_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/specialOffer/bindings/special_offer_binding.dart';
import '../modules/specialOffer/views/special_offer_view.dart';
import '../modules/topup/bindings/topup_binding.dart';
import '../modules/topup/views/topup_view.dart';
import '../modules/transactionHistory/bindings/transaction_history_binding.dart';
import '../modules/transactionHistory/views/transaction_history_view.dart';
import '../util/shared_prefs.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final PreferencesUtil util = PreferencesUtil();
  static final INITIAL = (util.isKeyExists(PreferencesUtil.kodePelanggan)!)
      ? Routes.HOME
      : Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION_HISTORY,
      page: () => const TransactionHistoryView(),
      binding: TransactionHistoryBinding(),
    ),
    GetPage(
      name: _Paths.TOPUP,
      page: () => const TopupView(),
      binding: TopupBinding(),
    ),
    GetPage(
      name: _Paths.QRIS,
      page: () => const QrisView(),
      binding: QrisBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTSUCCESS,
      page: () => const PaymentsuccessView(),
      binding: PaymentsuccessBinding(),
    ),
    GetPage(
      name: _Paths.POINTHISTORY,
      page: () => const PointhistoryView(),
      binding: PointhistoryBinding(),
    ),
    GetPage(
      name: _Paths.MEMBERSHIPPOINT,
      page: () => const MembershippointView(),
      binding: MembershippointBinding(),
    ),
    GetPage(
      name: _Paths.NEWSPROMOTION,
      page: () => const NewspromotionView(),
      binding: NewspromotionBinding(),
    ),
    GetPage(
      name: _Paths.GAMELIST,
      page: () => const GamelistView(),
      binding: GamelistBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SPECIAL_OFFER,
      page: () => const SpecialOfferView(),
      binding: SpecialOfferBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING,
      page: () => const BookingView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_HISTORY,
      page: () => const BookingHistoryView(),
      binding: BookingHistoryBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_NOTIF,
      page: () => const DetailNotifView(),
      binding: DetailNotifBinding(),
    ),
  ];
}
