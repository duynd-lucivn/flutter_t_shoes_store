import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/orders_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TOrderListItems(),
      ),
    );
  }
}
