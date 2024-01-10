import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/brand_card/brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_product.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Brand'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showBorder: true),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
