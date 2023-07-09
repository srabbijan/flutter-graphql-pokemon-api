import 'package:flutter/cupertino.dart';
import 'package:safewheel/utils/routes/routes_name.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushNamed(context, RoutesName.list);
  }
}
