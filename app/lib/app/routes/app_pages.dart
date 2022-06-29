import 'package:dy_getx/app/ui/pages/area_tel/index.dart';
import 'package:get/get.dart';
import 'package:dy_getx/app/ui/pages/commend/index.dart';
import 'package:dy_getx/app/ui/pages/fishbar/index.dart';
import 'package:dy_getx/app/ui/pages/focus/index.dart';
import 'package:dy_getx/app/ui/pages/funny/index.dart';
import 'package:dy_getx/app/ui/pages/home/index.dart';
import 'package:dy_getx/app/ui/pages/page_in_develop/index.dart';

import '../app.binding.dart';
import '../app.page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const AppPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.COMMEND,
      page: () => const CommendPage(),
      binding: CommendBinding(),
    ),
    GetPage(
      name: Routes.FUNNY,
      page: () => const FunnyPage(),
      binding: FunnyBinding(),
    ),
    GetPage(
      name: Routes.FISHBAR,
      page: () => const FishBarPage(),
      binding: FishBarBinding(),
    ),
    GetPage(
      name: Routes.FOCUS,
      page: () => const FocusPage(),
      binding: FocusBinding(),
    ),
    GetPage(
      name: Routes.PAGEINDEVELOP,
      page: () => const PageInDevelopPage(),
      binding: PageInDevelopBinding(),
    ),
    GetPage(
      name: Routes.AREATEL,
      page: () => const AreaTelPage(),
      binding: AreaTelBinding(),
    ),
  ];
}
