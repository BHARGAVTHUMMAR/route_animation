import 'package:get/get.dart';

import '../controllers/ditails_controller.dart';

class DitailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DitailsController>(
      () => DitailsController(),
    );
  }
}
