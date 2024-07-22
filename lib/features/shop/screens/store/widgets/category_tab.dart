import 'package:flutter/material.dart';
import 'package:t_store/features/shop/models/category_model.dart';

import '../../../../../common/widgets/brand_card/brand_show_case.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/product/product_controller.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TBrandShowcase(
                images: [TImages.productImage3, TImages.productImage2, TImages.productImage1],
              ),
              TSectionHeading(
                title: 'You might like',
                onPress: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => TProductCardVertical(
                        product: controller.featuredProducts[index],
                      )),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
