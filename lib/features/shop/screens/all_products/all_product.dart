import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/products/sortable/sortable_product.dart';
import '../../../../utils/constants/sizes.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TSortableProducts(),
        ),
      ),
    );
  }
}
