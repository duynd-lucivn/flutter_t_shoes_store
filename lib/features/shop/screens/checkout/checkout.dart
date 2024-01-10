import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../cart/widgets/cart_items.dart';
import 'widgets/billing_address_section.dart';
import 'widgets/billing_amount_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.dark : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: "Payment Success",
                subTitle: 'Your item will be ship now',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
