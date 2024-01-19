import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'lint_rules/pascal_case.dart';

// Entrypoint of plugin
PluginBase createPlugin() => _MyLints();

// The class listing all the [LintRule]s and [Assist]s defined by our plugin
class _MyLints extends PluginBase {
  // Lint rules
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
    PascalCase()
  ];

  // Assists
  @override
  List<Assist> getAssists() => [];
}