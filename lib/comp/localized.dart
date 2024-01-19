import 'package:openfoodfacts/openfoodfacts.dart';

class Localized {
  static String get(Map<OpenFoodFactsLanguage, String>? map) {
    var languages = OpenFoodAPIConfiguration.globalLanguages ?? List.empty();
    if (map == null || languages.isEmpty) {
      return 'No translation provided.';
    }

    for (var l in languages) {
      var value = map[l];
      if (value != null && value.isNotEmpty) {
        return value;
      }
    }

    return map.values.where((element) => element.isNotEmpty).firstOrNull ??
        'No translation provided.';
  }

  static String getMany(Map<OpenFoodFactsLanguage, List<String>>? map) {
    var languages = OpenFoodAPIConfiguration.globalLanguages ?? List.empty();
    if (map == null || languages.isEmpty) {
      return 'No translation provided.';
    }

    for (var l in languages) {
      var value = map[l];
      if (value != null && value.isNotEmpty) {
        return value.join(',');
      }
    }

    return map.values.where((element) => element.isNotEmpty).firstOrNull?.join(',') ??
        'No translation provided.';
  }
}
