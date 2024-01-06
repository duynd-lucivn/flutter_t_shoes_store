import 'package:flutter/material.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../authentication/screens/login/widgets/login_form.dart';
import '../../../authentication/screens/login/widgets/login_header.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Login , Title & Sub title
              TLoginHeader(),

              /// Form
              TLoginForm(),

              /// Divider
              TFormDivider(dividerTitle: TTexts.orSignInWith),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Footer
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
