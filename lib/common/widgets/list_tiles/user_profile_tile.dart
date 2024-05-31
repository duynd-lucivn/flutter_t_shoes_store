import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user/user_controller.dart';

import '../../../features/shop/screens/profile/profile.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/t_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    this.onPress,
  });
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Obx(() {
      final networkImage = controller.user.value.profilePicture;
      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
      return ListTile(
        leading: TCircularImage(
          isNetworkImage: networkImage.isNotEmpty,
          image: image,
          width: 50,
          height: 50,
          padding: 0,
        ),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
        ),
        trailing: IconButton(
            onPressed: onPress ?? () => Get.to(() => const ProfileScreen()),
            icon: const Icon(
              Iconsax.edit,
              color: TColors.white,
            )),
      );
    });
  }
}
