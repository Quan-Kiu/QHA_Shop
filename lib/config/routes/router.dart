import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/modules/auth/screen/forgotPassScreen/forgot_pass_screen.dart';
import 'package:doan/modules/auth/screen/loginScreen/login_screen.dart';
import 'package:doan/modules/auth/screen/registerScreen/register_screen.dart';
import 'package:doan/modules/home/screen/home_screen.dart';
import 'package:doan/modules/page_list_screen.dart';

import 'package:flutter/widgets.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.LOGIN_PAGE:
        return _GeneratePageRoute(
            widget: LoginScreen(), routeName: settings.name);
      case RoutesName.REGISTER_PAGE:
        return _GeneratePageRoute(
            widget: RegisterScreen(), routeName: settings.name);
      case RoutesName.FORGOT_PASS_PAGE:
        return _GeneratePageRoute(
            widget: ForgotPassScreen(), routeName: settings.name);
      case RoutesName.HOME_PAGE:
        return _GeneratePageRoute(
            widget: HomeScreen(), routeName: settings.name);
      case RoutesName.PAGE_LIST:
        return _GeneratePageRoute(widget: PageList(), routeName: settings.name);
      default:
        return _GeneratePageRoute(widget: PageList(), routeName: settings.name);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                textDirection: TextDirection.rtl,
                position: Tween<Offset>(
                  begin: Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}