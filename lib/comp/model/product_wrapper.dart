import 'package:openfoodfacts/openfoodfacts.dart';

class ProductProvider {
  ProductProvider({
    this.result,
  }) {
    warnings = result?.warnings ?? List.empty();
    errors = result?.errors ?? List.empty();
  }

  final ProductResultV3? result;
  late List<ProductResultFieldAnswer> warnings;
  late List<ProductResultFieldAnswer> errors;

  bool isPresent() {
    return result != null;
  }

  bool hasErrors() {
    return errors.isNotEmpty;
  }

  bool hasWarnings() {
    return warnings.isNotEmpty;
  }

  bool canPopulate() {
    return result?.product != null;
  }

  ProductWrapper populate() {
    if (result?.product == null) {
      throw Exception(
          "Populate failed. Check canPopulate() before populating.");
    }

    return ProductWrapper(
      product: result!.product!,
      warnings: result!.warnings ?? List.empty(),
      errors: result!.errors ?? List.empty(),
    );
  }
}

class ProductWrapper {
  ProductWrapper({
    required this.product,
    required this.warnings,
    required this.errors,
  });

  final Product product;
  final List<ProductResultFieldAnswer> warnings;
  final List<ProductResultFieldAnswer> errors;
}
