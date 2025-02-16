import 'package:econix/constants/app_color.dart';
import 'package:econix/constants/assets_path.dart';
import 'package:econix/constants/size.dart';
import 'package:econix/module/controller/app_controller.dart';
import 'package:econix/module/controller/data_controller.dart';
import 'package:econix/module/view/prodcut_details/components/placeholder.dart';
import 'package:econix/module/view/prodcut_details/components/review.dart';
import 'package:econix/widgets/action_icon.dart';
import 'package:econix/widgets/custom_app_bar.dart';
import 'package:econix/widgets/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'components/info_with_button.dart';
// import 'components/recommened_product.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  DataController dataCtrl = Get.find();
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    String id = ModalRoute.of(context)!.settings.arguments as String;
    await dataCtrl.getProductDetails(id: id);
  }

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: dataCtrl.detailsLoading.value
              ? DetailsPlaceholder()
              : Column(
                  children: [
                    DetailsAppBar(),
                    Expanded(
                      child: ListView(
                        controller: appCtrl.detailsPageScrollCtrl,
                        children: [
                          Info(),
                          getVerticalSpace(25),
                          DescriptionPanel(),
                          getVerticalSpace(30),
                          // RecommenedProduct(),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    return AppBarCard(
      color: Color(0xffF1F1F1),
      childWidget: Row(
        children: [
          InkWell(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                backIcon,
                color: kPrimary,
              )),
          getHorizontalSpace(10),
          Text(
            "Details",
            style: TextStyle(
              fontSize: getTextSize(18),
              fontWeight: FontWeight.bold,
              color: kPrimary,
            ),
          ),
          Spacer(),
          ActionIcon(
              icon: searchIcon,
              press: () {
                showSearch(context: context, delegate: CustomSearch());
              }),
          getHorizontalSpace(15),
          ActionIcon(
              icon: cartIcon,
              visible: true,
              press: () {
                Get.back();
                appCtrl.changePage(2);
              }),
        ],
      ),
    );
  }
}
