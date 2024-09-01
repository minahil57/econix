import 'package:econix/config/routes/app_route.dart';
import 'package:econix/constants/size.dart';
import 'package:econix/module/controller/data_controller.dart';
import 'package:econix/utils/helper/loader.dart';
import 'package:econix/widgets/header_text.dart';
import 'package:econix/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController data = Get.find();
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderText(text: "Best Seller", press: true),
          getVerticalSpace(15),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(4, (index) {
              if (data.isLoading.value)
                return ShimmerLoader(
                  height: getScreenHeight(260),
                  width: getScreeWidth(165),
                );
              else
                return Container(
                  height: getScreenHeight(260),
                  width: getScreeWidth(165),
                  child: ProductItem(
                    item: data.productData.value.products![index],
                    press: () {
                      Get.toNamed(AppRoute.detailsPage,
                          arguments:
                              data.productData.value.products![index].id);
                    },
                  ),
                );
            }),
          )
        ],
      ),
    );
  }
}
