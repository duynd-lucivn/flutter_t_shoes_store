import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Form
              const TSignUpForm(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TFormDivider(dividerTitle: TTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
