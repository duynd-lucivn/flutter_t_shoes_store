import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/brand_card/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(title: 'Brands'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TGridLayout(
                  itemCount: 8,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) => TBrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
