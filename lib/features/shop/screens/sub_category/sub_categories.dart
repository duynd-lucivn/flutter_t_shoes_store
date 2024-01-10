import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sport'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                imageUrl: TImages.promoBanner3,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Column(
                children: [
                  TSectionHeading(
                    title: 'Sport shirts',
                    onPress: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemBuilder: (context, index) => const TProductCardHorizontal(),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
