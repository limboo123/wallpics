
import 'package:get/get.dart';
import 'package:rest/model/model_class.dart';
import 'package:rest/service/wallpaper_services.dart';

class HomeViewModel extends GetxController {
  bool isLoading = false;
  Map<String, List<Wpmodel>> wallpapers = {};

  vmGetwallpaperData(String category) async {
    isLoading = true;
    update();
    wallpapers[category] = await WallpaperServices().fatchNature(category);
    isLoading =false;
    update();
  }

  List<Wpmodel> vmWallpapers(String category) {
    return wallpapers[category] ?? [];
  }
}
