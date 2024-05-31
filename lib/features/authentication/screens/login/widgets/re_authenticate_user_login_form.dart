import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/features/personalization/controllers/user/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ReAuthenticateUserLoginForm extends StatelessWidget {
  const ReAuthenticateUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
          title: Text('Re Authenticate User'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
              key: controller.reAuthFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.verifyEmail,
                      validator: (value) => TValidator.validateEmail(value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.direct_right,
                        ),
                        labelText: TTexts.email,
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: controller.verifyPassword,
                        validator: (value) => TValidator.validateEmptyText(TTexts.password, value),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Iconsax.password_check,
                          ),
                          labelText: TTexts.password,
                          suffixIcon: IconButton(
                            icon: controller.hidePassword.value ? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye),
                            onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                        child: const Text('Verify'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
