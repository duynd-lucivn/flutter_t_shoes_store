import 'package:t_store/features/personalization/models/banner_model.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TDummyData {
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: "TRoutes.order", active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: "TRoutes.order", active: false),
    BannerModel(imageUrl: TImages.banner3, targetScreen: "TRoutes.order", active: false),
    BannerModel(imageUrl: TImages.banner4, targetScreen: "TRoutes.order", active: false),
    BannerModel(imageUrl: TImages.banner5, targetScreen: "TRoutes.order", active: false),
    BannerModel(imageUrl: TImages.banner6, targetScreen: "TRoutes.order", active: false),
    BannerModel(imageUrl: TImages.banner7, targetScreen: "TRoutes.order", active: false),
    BannerModel(imageUrl: TImages.banner8, targetScreen: "TRoutes.order", active: false),
  ];
}
