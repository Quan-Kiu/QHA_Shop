import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/modules/auth/screen/forgotPassScreen/forgot_pass_screen.dart';
import 'package:doan/modules/auth/screen/loginScreen/login_screen.dart';
import 'package:doan/modules/auth/screen/registerScreen/register_screen.dart';
import 'package:doan/modules/category/screen/category_list.dart';
import 'package:doan/modules/home/screen/home_screen.dart';
import 'package:doan/modules/orders/order_detail_page/order_detail_page.dart';
import 'package:doan/modules/orders/orders_page/orders_page.dart';
import 'package:doan/modules/page_list_screen.dart';
import 'package:doan/modules/product_detail/screen/product_detail_screen.dart';
import 'package:doan/modules/auth/screen/info/info_screen.dart';
import 'package:doan/modules/auth/screen/renameScreen/rename_screen.dart';
import 'package:doan/modules/auth/screen/sexScreen/sex_screen.dart';
import 'package:doan/modules/auth/screen/dateofbirthScreen/dateofbith_screen.dart';
import 'package:doan/modules/auth/screen/emailScreen/email_screen.dart';
import 'package:doan/modules/auth/screen/PhoneScreen/phone_Screen.dart';
import 'package:doan/modules/auth/screen/changePasswordScreen/changePassword_screen.dart';
import 'package:doan/modules/product_favorite/screen/product_favarite.dart';
import 'package:doan/modules/product_list/screen/product_list.dart';

import 'package:flutter/widgets.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.LOGIN_PAGE:
        return _GeneratePageRoute(
            widget: const LoginScreen(), routeName: settings.name);
      case RoutesName.REGISTER_PAGE:
        return _GeneratePageRoute(
            widget: const RegisterScreen(), routeName: settings.name);
      case RoutesName.FORGOT_PASS_PAGE:
        return _GeneratePageRoute(
            widget: const ForgotPassScreen(), routeName: settings.name);
      case RoutesName.HOME_PAGE:
        return _GeneratePageRoute(
            widget: const HomeScreen(), routeName: settings.name);
      case RoutesName.PRODUCT_DETAIL_PAGE:
        return _GeneratePageRoute(
            widget: const ProductDetail(), routeName: settings.name);
      case RoutesName.INFO_PAGE:
        return _GeneratePageRoute(
            widget: const InfoPageScreen(), routeName: settings.name);
      case RoutesName.RENAME_PAGE:
        return _GeneratePageRoute(
            widget: const RenamePageScreen(), routeName: settings.name);
      case RoutesName.SEX_PAGE:
        return _GeneratePageRoute(
            widget: const SexPageScreen(), routeName: settings.name);
      case RoutesName.DATEOFBIRTH_PAGE:
        return _GeneratePageRoute(
            widget: const DateOBPageScreen(), routeName: settings.name);
      case RoutesName.EMAIL_PAGE:
        return _GeneratePageRoute(
            widget: const EmailPageScreen(), routeName: settings.name);
      case RoutesName.PHONE_PAGE:
        return _GeneratePageRoute(
            widget: const PhonePageScreen(), routeName: settings.name);
      case RoutesName.CHANGEPASSWORD_PAGE:
        return _GeneratePageRoute(
            widget: const ChangePasswordPageScreen(), routeName: settings.name);
      case RoutesName.PAGE_LIST:
        return _GeneratePageRoute(widget: PageList(), routeName: settings.name);

      case RoutesName.ORDERS_PAGE:
        return _GeneratePageRoute(
            widget: const OrdersPage(), routeName: settings.name);

      case RoutesName.ORDER_DETAUL_PAGE:
        return _GeneratePageRoute(
            widget: const OrderDetail(), routeName: settings.name);

      case RoutesName.PRODUCT_FAVORITE_PAGE:
        return _GeneratePageRoute(
            widget: Product_Favorite(), routeName: settings.name);
      case RoutesName.CATEGORY_PAGE:
        return _GeneratePageRoute(
            widget: const Category_List(), routeName: settings.name);
      case RoutesName.LIST_PRODUCT_PAGE:
        return _GeneratePageRoute(
            widget: ProductList(), routeName: settings.name);
      default:
        return _GeneratePageRoute(widget: PageList(), routeName: settings.name);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  // ignore: prefer_typing_uninitialized_variables
  final routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                textDirection: TextDirection.rtl,
                position: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
