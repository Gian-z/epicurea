import 'package:openfoodfacts/openfoodfacts.dart';

class ProductProvider {
  ProductProvider({
    this.Result,
  }) {
    Warnings = Result?.warnings ?? List.empty();
    Errors = Result?.errors ?? List.empty();
  }

  final ProductResultV3? Result;
  late List<ProductResultFieldAnswer> Warnings;
  late List<ProductResultFieldAnswer> Errors;

  bool isPresent() {
    return Result != null;
  }

  bool hasErrors() {
    return Errors.isNotEmpty;
  }

  bool hasWarnings() {
    return Warnings.isNotEmpty;
  }

  bool canPopulate() {
    return Result?.product != null;
  }

  ProductWrapper populate() {
    if (Result?.product == null) {
      throw Exception(
          "Populate failed. Check canPopulate() before populating.");
    }

    return ProductWrapper(
      product: Result!.product!,
      warnings: Result!.warnings ?? List.empty(),
      errors: Result!.errors ?? List.empty(),
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
