import 'package:econix/constants/app_color.dart';
import 'package:econix/constants/assets_path.dart';
import 'package:econix/constants/size.dart';
import 'package:econix/module/controller/app_controller.dart';
import 'package:econix/module/view/home/components/flash_sale.dart';
import 'package:econix/module/view/home/components/special_product.dart';
import 'package:econix/widgets/custom_app_bar.dart';
import 'package:econix/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/banner_slider.dart';
import 'components/best_seller.dart';
import 'components/feature_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppController appCtrl = Get.find();

    return GetBuilder<AppController>(
        init: AppController(),
        builder: (appCtrl) {
          return Column(
            children: [
              AppBarCard(
                childWidget: Row(
                  children: [
                    Image.asset(ukFlagImg, height: 20, width: 20),
                    getHorizontalSpace(15),
                    Flexible(child: SearchField()),
                    getHorizontalSpace(5),
                    DrawerIcon()
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsets.only(top: 0, bottom: 15),
                      controller: appCtrl.homeScrollCtrl,
                      children: [
                        BannerPanel(),
                        FeatureList(),
                        getVerticalSpace(30),
                        BestSeller(),
                        getVerticalSpace(30),
                        FlashSale(),
                        getVerticalSpace(30),
                        SpecialProduct(),
                      ],
                    ),
                    AnimatedPositioned(
                      duration: 700.milliseconds,
                      curve: Curves.easeIn,
                      top: appCtrl.showScrollUp.value
                          ? getScreenHeight(30)
                          : getScreenHeight(-100),
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          appCtrl.scrollUp();
                        },
                        child: CircleAvatar(
                          backgroundColor: kLightNavy,
                          radius: 16,
                          child: Icon(
                            Icons.keyboard_arrow_up_sharp,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
