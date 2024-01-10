import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banner,
  });
  final List<String> banner;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banner.map((imageUrl) => TRoundedImage(imageUrl: imageUrl)).toList(),
          options: CarouselOptions(viewportFraction: 1, onPageChanged: (index, _) => controller.updatePageIndicator(index)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banner.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carousalCurrentIndex.value == i ? TColors.primary : TColors.grey,
                    margin: const EdgeInsets.only(right: 10),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
