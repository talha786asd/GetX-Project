import 'package:get/get.dart';
import 'package:getx_app/models/products_model.dart';
import 'package:getx_app/services/remote_services.dart';

class ProductsController extends GetxController {
  var isLoading = true.obs;
  var productsList = <Product>[].obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.getUsers();
      if (products != null) {
        productsList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
