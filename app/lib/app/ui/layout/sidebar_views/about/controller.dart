import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import 'state.dart';

class AboutController extends GetxController {

  final state = AboutState();

  @override
  void onInit() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    state.version.value = packageInfo.version;

    super.onInit();
  }
}
