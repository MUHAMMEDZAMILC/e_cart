import 'package:e_cart/utils/helper/hemper_method.dart';
import 'package:e_cart/utils/helper/pagenavigator.dart';
import 'package:e_cart/view/pages/product/productviewscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../model/products_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/globalvariable.dart';
import '../../../../utils/helper/help_screensize.dart';
import '../../../../utils/string.dart';
import '../../../components/apprichtext.dart';
import '../../../components/apptext.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.data});
  Product data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Screen.open(context, ProductScreen(data: data));
      },
      child: Padding(
        padding: const EdgeInsets.all(paddingTiny),
        child: Container(
          width: ScreenUtil.screenWidth! * 0.42,
          height: ScreenUtil.screenWidth! * 0.6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: ColorResources.BORDER)),
          child: Padding(
            padding: const EdgeInsets.all(paddingSmall),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        Container(
                          decoration:  BoxDecoration(
                              // color: ColorResources.CHART_BOOKING,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    getimage(),
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorResources.WHITE,
                                border: Border.all(
                                    color: ColorResources.ICON_GREY, width: 0.4),
                                borderRadius: BorderRadius.circular(2)),
                            child: Padding(
                              padding: const EdgeInsets.all(paddingTiny),
                              child: Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.star_fill,
                                    color: ColorResources.YELLOW,
                                    size: 14,
                                  ),
                                  gapHorizontalSmall,
                                  AppText(
                                    text: data.rating.toString(),
                                    weight: FontWeight.w500,
                                    size: 12,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        text: data.brand??'',
                        weight: FontWeight.w400,
                        letterspace: 0.5,
                        maxline: 2,
                      ),
                      AppText(
                        text: data.name??'',
                        weight: FontWeight.w500,
                        letterspace: 0.5,
                        maxline: 1,
                      ),
                      AppRichText(
                        normalText: '$rupeesymbol ${data.afterdis}  ',
                        richText: '$rupeesymbol ${data.price}',
                        normalTextColor: ColorResources.BLACK,
                        richTextColor: ColorResources.BLACKGREY.withOpacity(0.5),
                        normalFontWeight: FontWeight.w500,
                        richTextFontSize: 12,
                        richdec: TextDecoration.lineThrough,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}