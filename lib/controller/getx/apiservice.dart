import 'dart:developer';
import 'dart:io';

import 'package:e_cart/controller/url.dart';
import 'package:http/http.dart' as http;

import '../../model/products_model.dart';
import '../../utils/helper/help_toast.dart';

class ApiService {
  // get products api service
  getproduct(context) async{
    var url = '$baseurl$getproducts';
    log(url);
    List<Product> empty = [];
    try {
       final Uri uri = Uri.parse(url);
    var response = await http.get(uri, );
    log(response.body);
    if (response.statusCode == 200) {
      try {
        return productFromJson(response.body);
      } catch (e) {
        return empty;
      }
    }
    } on SocketException{

      snackBar(context, message: 'Network is Offline');
      return empty;
    } catch (e) {
      showcustomtoast(context, message: 'Error Occur $e');
      return empty;
      // throw Exception(e);
    }

  }
  
}