import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/features/personalization/controllers/update_user/update_name_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Text(
                  'User real name for easy verification. This name will apear on several pages.',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Form(
                  key: controller.updateUserNameFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value) => TValidator.validateEmptyText(TTexts.firstName, value),
                        expands: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.user,
                          ),
                          labelText: TTexts.firstName,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value) => TValidator.validateEmptyText(TTexts.lastName, value),
                        expands: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.user,
                          ),
                          labelText: TTexts.lastName,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ///Sign in Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.updateUserName(),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
