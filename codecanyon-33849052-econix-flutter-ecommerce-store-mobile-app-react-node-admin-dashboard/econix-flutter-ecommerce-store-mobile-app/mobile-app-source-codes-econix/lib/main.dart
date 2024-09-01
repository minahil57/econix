import 'package:econix/config/routes/app_route.dart';
import 'package:econix/constants/app_color.dart';
import 'package:econix/utils/helper/bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/service/payment/payment.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  PaymentService.instance.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: kPrimary,
    ),
  );
  GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Econix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(),
        scaffoldBackgroundColor: Color(0xffFFFFFF),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: kPrimary,
          titleSpacing: 0.0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      initialRoute: AppRoute.splashPage,
      defaultTransition: Transition.cupertino,
      getPages: AppRoute.getPage,
    );
  }
}
