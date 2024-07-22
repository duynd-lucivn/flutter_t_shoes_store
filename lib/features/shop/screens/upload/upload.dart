import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:t_store/features/personalization/controllers/product/product_controller.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AppBar(
                title: Text('Upload Data'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(TSizes.defaultSpace, TSizes.defaultSpace, TSizes.defaultSpace, 0),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: 'Main Record',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSettingsMenuTile(icon: Iconsax.menu, title: 'Upload Categories', subTitle: '', onTap: () => {}),
                  const TSettingsMenuTile(icon: Iconsax.shop, title: 'Upload Brands', subTitle: ''),
                  const TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'Upload Products',
                    subTitle: '',
                  ),
                  const TSettingsMenuTile(icon: Iconsax.image, title: 'Upload Banners', subTitle: ''),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'Relationships',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTile(icon: Iconsax.sync, title: 'Upload Brands & Categories Relation Data', subTitle: '', onTap: () => {}),
                  TSettingsMenuTile(
                      icon: Iconsax.document_upload, title: 'Upload Product & Categories Relational Data', subTitle: '', onTap: () => {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
