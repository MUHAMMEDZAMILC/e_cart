import 'package:e_cart/controller/getx/getxoperation.dart';
import 'package:e_cart/model/products_model.dart';
import 'package:e_cart/utils/colors.dart';
import 'package:e_cart/utils/dimensions.dart';
import 'package:e_cart/utils/helper/help_loader.dart';
import 'package:e_cart/utils/helper/help_screensize.dart';
import 'package:e_cart/utils/string.dart';
import 'package:e_cart/utils/theme_data.dart';
import 'package:e_cart/view/components/apprichtext.dart';
import 'package:e_cart/view/components/apptext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/productcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetxOperation getoperation = Get.put(GetxOperation());
  @override
  void initState() {
    getoperation.getproduct(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: ColorResources.BLACK.withOpacity(0.2),
        surfaceTintColor: ColorResources.WHITE,
        backgroundColor: ColorResources.WHITE,
        title: AppText(
          text: 'E_Cart',
          weight: FontWeight.w500,
          letterspace: 0.8,
          size: 16,
          color: primarycolor,
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.all(paddingSmall),
              child: Icon(
                CupertinoIcons.bell,
                color: ColorResources.BLACK,
              ))
        ],
      ),
      body: Obx(() {
        if (getoperation.isLoading.value) {
          return const PageEntryLoader();
        } else if (getoperation.product.isEmpty) {
          return  Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(CupertinoIcons.exclamationmark_octagon,color: ColorResources.RED,size: 30,),
              gap,
              AppText(text:  "No data available",weight: FontWeight.w500,letterspace: 0.5,color: ColorResources.RED,),
            ],
          ));
        } else {
          return SizedBox(
            width: ScreenUtil.screenWidth,
            height: ScreenUtil.screenHeight,
            child: Padding(
              padding: const EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // New Arrivals Part
                  AppText(
                    text: 'New Arrivals',
                    weight: FontWeight.w500,
                    size: 16,
                    color: ColorResources.TEXT1,
                  ),
                  gap,
                  SizedBox(
                    height: ScreenUtil.screenWidth! * 0.56,
                    width: ScreenUtil.screenWidth,
                    child: ListView.builder(
                      itemCount: getoperation.product.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          data: getoperation.product[index],
                        );
                      },
                    ),
                  ),
                  gap,
                  // Trending Products
                  AppText(
                    text: 'Trending Products',
                    weight: FontWeight.w500,
                    size: 16,
                    color: ColorResources.TEXT1,
                  ),
                  gap,
                  SizedBox(
                    height: ScreenUtil.screenWidth! * 0.56,
                    width: ScreenUtil.screenWidth,
                    child: ListView.builder(
                      itemCount: getoperation.product.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          data: getoperation.product[index],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}


