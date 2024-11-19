import 'package:e_cart/utils/colors.dart';
import 'package:e_cart/utils/helper/help_screensize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/products_model.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/string.dart';
import '../../components/apprichtext.dart';
import '../../components/apptext.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.data});
  Product data;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: ColorResources.BLACK.withOpacity(0.2),
        backgroundColor: ColorResources.WHITE,
        surfaceTintColor: ColorResources.WHITE,
      ),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: ScreenUtil.screenWidth,
                    height: ScreenUtil.screenHeight! * 0.5,
                    decoration: const BoxDecoration(
                        color: ColorResources.WHITE,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://static.vecteezy.com/system/resources/previews/022/722/945/non_2x/samsung-galaxy-s23-ultra-transparent-image-free-png.png'),
                            fit: BoxFit.contain)),
                  ),
                  Positioned(
                    right: 20,
                    top: 20,
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.star_fill,
                          color: ColorResources.YELLOW,
                          size: 20,
                        ),
                        gapHorizontalSmall,
                        AppText(
                          text: widget.data.rating.toString(),
                          weight: FontWeight.w500,
                          size: 16,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(padding),
                child: Column(
          
                  children: [
                    AppText(text: "${widget.data.brand ?? ''} | ${widget.data.name ?? ''} | ${widget.data.category ?? ''} | ${widget.data.description ?? ''}",size: 14,letterspace: 0.5,color: ColorResources.BLACK.withOpacity(0.8),),
                  ],
                ),
              ),
              Divider(
                color: ColorResources.BLACK.withOpacity(0.2),
                thickness: 0.8,
              ),
              Padding(
                padding: const EdgeInsets.all(padding),
                child: AppRichText(
                  normalText: '$rupeesymbol ${widget.data.afterdis}  ',
                  richText: '$rupeesymbol ${widget.data.price}',
                  normalTextColor: ColorResources.AMTGREEN,
                  richTextColor: ColorResources.BLACKGREY.withOpacity(0.5),
                  normalFontWeight: FontWeight.w500,
                  richTextFontSize: 14,
                  fontSize: 20,
                  richdec: TextDecoration.lineThrough,
                ),
              ),
              gap,
              Padding(
                padding: const EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: 'Reviews',weight: FontWeight.w500,letterspace: 0.5,size: 16,),
                       gapSmall,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                  Review? reviewdata;
                  if (widget.data.reviews!=null && widget.data.reviews!.isNotEmpty) {
                      reviewdata = widget.data.reviews![index];
                  }
                  return ListTile(
                    title: Row(
                      children: [
                       
                        AppText(text: reviewdata?.rating.toString()??''),
                        gapHorizontalLarge,
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: ColorResources.YELLOW,
                            size: 13
                          ),
                      ],
                    ),
                    subtitle: AppText(text: reviewdata?.comment??'',color:ColorResources.BLACKGREY ,),
                  );
                }, separatorBuilder: (context, index) => Divider(height: 1,color: ColorResources.BLACK.withOpacity(0.1),thickness: 0.5,), itemCount: widget.data.reviews?.length??0)
                  ],
                ),
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
