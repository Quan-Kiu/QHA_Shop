import 'package:doan/config/routes/routes_name.dart';
import 'package:doan/modules/account/account_screen.dart';
import 'package:doan/modules/addcheckout/checkout.dart';
import 'package:doan/modules/address/address.dart';
import 'package:doan/modules/address/select_address.dart';
import 'package:doan/modules/auth/forgotPassScreen/forgot_pass_screen.dart';
import 'package:doan/modules/auth/loginScreen/login_screen.dart';
import 'package:doan/modules/auth/registerScreen/register_screen.dart';
import 'package:doan/modules/cart/cart_page.dart';
import 'package:doan/modules/checkout/checkout.dart';
import 'package:doan/modules/checkout_complete/ckout_complete.dart';
import 'package:doan/modules/comments/comment_page/comment_page.dart';
import 'package:doan/modules/comments/create_comment_page/create_comment_page.dart';
import 'package:doan/modules/discount_page/discount_page.dart';
import 'package:doan/modules/flash/flash_screen.dart';
import 'package:doan/modules/home/home_screen.dart';
import 'package:doan/modules/notify/activitys/activitys_notify_page.dart';
import 'package:doan/modules/notify/notify_page.dart';
import 'package:doan/modules/notify/posts/posts_notify_page.dart';
import 'package:doan/modules/orders/order_check_page/order_check.dart';
import 'package:doan/modules/orders/order_detail_page/order_detail_page.dart';
import 'package:doan/modules/orders/orders_page/orders_page.dart';
import 'package:doan/modules/page_list_screen.dart';
import 'package:doan/modules/payment_card/payment_page.dart';
import 'package:doan/modules/product_category/product_category.dart';
import 'package:doan/modules/product_detail/product_detail_screen.dart';
import 'package:doan/modules/product_favorite/product_favarite.dart';
import 'package:doan/modules/profile/addaddress/addaddress_screen.dart';
import 'package:doan/modules/profile/addcard/addcard_screen.dart';
import 'package:doan/modules/profile/changePasswordScreen/changePassword_screen.dart';
import 'package:doan/modules/profile/info/info_screen.dart';
import 'package:doan/modules/profile/updateaddress/updateaddress_screen.dart';
import 'package:doan/modules/search/search_page.dart';
import 'package:doan/modules/transpost_page/transpost.dart';
import 'package:doan/modules/profile/changeprofile/changeprofilescreen.dart';
import 'package:flutter/widgets.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.FLASH_PAGE:
        return _GeneratePageRoute(
            widget: const FlashScreen(), routeName: settings.name);
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
            widget: ProductDetail(
              product: settings.arguments,
            ),
            routeName: settings.name);
      case RoutesName.INFO_PAGE:
        return _GeneratePageRoute(
            widget: const InfoPageScreen(), routeName: settings.name);

      case RoutesName.CHANGEPASSWORD_PAGE:
        return _GeneratePageRoute(
            widget: const ChangePasswordPageScreen(), routeName: settings.name);
      case RoutesName.PAGE_LIST:
        return _GeneratePageRoute(widget: PageList(), routeName: settings.name);

      case RoutesName.ORDERS_PAGE:
        return _GeneratePageRoute(
            widget: OrdersPage(), routeName: settings.name);

      case RoutesName.ORDER_CHECK_PAGE:
        return _GeneratePageRoute(
            widget: OrderCheck(shippingInfo: settings.arguments),
            routeName: settings.name);

      case RoutesName.ORDER_DETAIL_PAGE:
        return _GeneratePageRoute(
          widget: OrderDetail(order: settings.arguments),
          routeName: settings.name,
        );

      case RoutesName.CART_PAGE:
        return _GeneratePageRoute(
            widget: const CartPage(), routeName: settings.name);

      case RoutesName.COMMENT_PAGE:
        return _GeneratePageRoute(
            widget: CommentPage(data: settings.arguments),
            routeName: settings.name);

      case RoutesName.CREATE_COMMENT_PAGE:
        return _GeneratePageRoute(
            widget: CreateCommentPage(product: settings.arguments),
            routeName: settings.name);

      case RoutesName.PRODUCT_FAVORITE_PAGE:
        return _GeneratePageRoute(
            widget: Product_Favorite(), routeName: settings.name);

      case RoutesName.PRODUCT_CATEGORY:
        return _GeneratePageRoute(
            widget: ProductCategory(type: settings.arguments),
            routeName: settings.name);

      case RoutesName.ADD_ADDRESS_PAGE:
        return _GeneratePageRoute(
            widget: const AddAddressPage(), routeName: settings.name);
      case RoutesName.SELECT_ADDRESS_PAGE:
        return _GeneratePageRoute(
            widget: const SelectAddress(), routeName: settings.name);

      case RoutesName.ADD_CARD_PAGE:
        return _GeneratePageRoute(
            widget: const AddCardPageScreen(), routeName: settings.name);

      case RoutesName.ACCOUNT_PAGE:
        return _GeneratePageRoute(
            widget: const AccountPageScreen(), routeName: settings.name);

      case RoutesName.POSTS_NOTIFY_PAGE:
        return _GeneratePageRoute(
            widget: const Posts_Notify_Page(), routeName: settings.name);

      case RoutesName.ACTIVITIES_NOTIFY_PAGE:
        return _GeneratePageRoute(
            widget: const Activities_Notify_Page(), routeName: settings.name);

      case RoutesName.SEARCH_PAGE:
        return _GeneratePageRoute(
            widget: const Search_Page(), routeName: settings.name);

      case RoutesName.NOTIFY_PAGE:
        return _GeneratePageRoute(
            widget: const NotifyPage(), routeName: settings.name);

      case RoutesName.DISCOUNT_PAGE:
        return _GeneratePageRoute(
            widget: DiscountPage(), routeName: settings.name);
      case RoutesName.TRANS_POST_PAGE:
        return _GeneratePageRoute(
            widget: const TransPost(), routeName: settings.name);
      case RoutesName.CHECKOUT_TYPE_PAGE:
        return _GeneratePageRoute(
            widget: const CheckoutPage(), routeName: settings.name);
      case RoutesName.CHECKOUT_COMPLETE_PAGE:
        return _GeneratePageRoute(
            widget: const Checkout_Complete(), routeName: settings.name);
      case RoutesName.ADDRESS_PAGE:
        return _GeneratePageRoute(widget: Address(), routeName: settings.name);

      case RoutesName.PAYMENTCARD_PAGE:
        return _GeneratePageRoute(
            widget: const Paymentcard(), routeName: settings.name);
      case RoutesName.ADDCHECKOUT_PAGE:
        return _GeneratePageRoute(
            widget: const AddCheckout(), routeName: settings.name);
      case RoutesName.CHANGEPROFILE_PAGE:
        return _GeneratePageRoute(
            widget: const ChangeProfile(), routeName: settings.name);

      case RoutesName.UPDATE_ADDRESS_PAGE:
        return _GeneratePageRoute(
            widget: UpdateAddressPage(
              shippingInfo: settings.arguments,
            ),
            routeName: settings.name);
      default:
        return _GeneratePageRoute(widget: PageList(), routeName: settings.name);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  // ignore: prefer_typing_uninitialized_variables
  final routeName;
  _GeneratePageRoute({
    required this.widget,
    required this.routeName,
  }) : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 500),
          // transitionsBuilder: (BuildContext context,
          //     Animation<double> animation,
          //     Animation<double> secondaryAnimation,
          //     Widget child) {
          //   return SlideTransition(
          //     textDirection: TextDirection.rtl,
          //     position: Tween<Offset>(
          //       begin: const Offset(-1.0, 0.0),
          //       end: Offset.zero,
          //     ).animate(animation),
          //     child: child,
          //   );
        );
}
