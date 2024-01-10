import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/features/shop/screens/order/widgets/orders_list.dart';
import 'package:t_store/utils/constants/sizes.dart';

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
