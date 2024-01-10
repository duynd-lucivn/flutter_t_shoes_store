import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_new_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Address', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [TSingleAddress(selectedAddress: true), TSingleAddress(selectedAddress: false)],
          ),
        ),
      ),
    );
  }
}
