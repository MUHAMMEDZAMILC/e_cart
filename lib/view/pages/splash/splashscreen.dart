import 'dart:async';

import 'package:e_cart/utils/colors.dart';
import 'package:e_cart/utils/theme_data.dart';
import 'package:e_cart/view/components/apptext.dart';
import 'package:e_cart/view/pages/home/homescreen.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper/pagenavigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), (){
      Screen.openAsNewPage(context, const HomeScreen());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: AppText(text: 'E_Cart',color: primarycolor,weight: FontWeight.w500,size: 20,),
        ),
      ),
    );
  }
}