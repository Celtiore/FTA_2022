import 'package:fta/programmer9211-blog/app/data/firebase/firebase_functions.dart';
import 'package:fta/programmer9211-blog/app/data/global_widgets/indicator.dart';
import 'package:fta/programmer9211-blog/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:fta/programmer9211-blog/app/modules/home/controllers/home_controller.dart';
import 'package:fta/programmer9211-blog/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BlogDetailScreenController extends GetxController {
  final controller = Get.find<HomeController>();
  final FirebaseFunctions _firebaseFunctions = FirebaseFunctions();
  var isAdded = false.obs;

  void addToFavourite(String id) async {
    Indicator.showLoading();

    await _firebaseFunctions.addToFavourite(id).then((value) async {
      await controller.getFavouriteList();

      if (Get.isRegistered<FavouriteController>()) {
        Get.find<FavouriteController>().getFavouriteList();
      }

      Indicator.closeLoading();
      checkIfAlreadyFavourite(id);
    });
  }

  void deleteFromFavourite(String id) async {
    Indicator.showLoading();

    await _firebaseFunctions.deleteFromFavorite(id).then((value) async {
      await controller.getFavouriteList();

      if (Get.isRegistered<FavouriteController>()) {
        Get.find<FavouriteController>().getFavouriteList();
      }

      Indicator.closeLoading();
      isAdded.value = false;
      checkIfAlreadyFavourite(id);
    });
  }

  void checkIfAlreadyFavourite(String id) {
    for (var i = 0; i < controller.favouriteList.length; i++) {
      if (controller.favouriteList[i] == id) {
        isAdded.value = true;

        break;
      }
    }
  }
}
