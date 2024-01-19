import 'package:epicurea/comp/model/product_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductService {
  static Future<ProductProvider> getProduct(Barcode barcode) async {
    var barcodeValue = barcode.rawValue!;
    ProductResultV3? product;
    try {
      product = await OpenFoodAPIClient.getProductV3(ProductQueryConfiguration(
          barcodeValue,
          version: ProductQueryVersion.v3));
    } catch (e) {
      debugPrint(e.toString());
    }

    return ProductProvider(result: product);
  }
}
