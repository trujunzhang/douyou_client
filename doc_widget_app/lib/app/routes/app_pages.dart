import 'package:doc_widget_app/app/ui/widgets_preview/index.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.DOC_PREVIEW,
      page: () => const WidgetsPreviewPage(),
      binding: WidgetsPreviewBinding(),
    ),
  ];
}
