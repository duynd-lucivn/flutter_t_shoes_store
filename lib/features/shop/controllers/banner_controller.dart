import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banners_repository.dart';
import 'package:t_store/features/personalization/models/banner_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => carousalCurrentIndex.value = index;
  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  Future<void> fetchBanner() async {
    try {
      isLoading.value = true;
      final banners = await _bannerRepository.fetchBanners();

      this.banners.assignAll(banners);
//      featuredCategories.assignAll(allCategories.where((category) => category.isFeature && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
