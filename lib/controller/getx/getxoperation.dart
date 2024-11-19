
import 'package:e_cart/controller/getx/apiservice.dart';
import 'package:e_cart/model/products_model.dart';
import 'package:get/get.dart';

class GetxOperation extends GetxController {
  var isLoading = false.obs;
  ApiService ntop = ApiService();

  // get product controller
  var product=<Product>[].obs;
  getproduct(context) async{
    isLoading.value=true;
     product.value = await ntop.getproduct(context);
    isLoading.value = false;
  }
}