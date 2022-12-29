import 'package:flutter/cupertino.dart';

import '../views/login_view.dart';
import '../views/register_view.dart';
import 'string_utils.dart';

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    loginRouteName: (context) => const LoginView(),
    registerRouteName: (context) => const RegisterView()
  };
}
