import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: 'Newbie',
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'User ID ',
                value: '45678',
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: 'newbie@study.com',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: '+849******88',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '22 May, 2000',
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
