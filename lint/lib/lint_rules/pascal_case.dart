import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class PascalCase extends DartLintRule {
  PascalCase() : super(code: _code);

  final RegExp pascalCaseRegex = RegExp(r'^[A-Z][a-zA-Z0-9]*$');
  static const LintCode _code = LintCode(
    name: 'property_pascal_case',
    problemMessage: 'Properties should be in PascalCase',
  );

  @override
  void run(
      CustomLintResolver resolver,
      ErrorReporter reporter,
      CustomLintContext context,
      ) {
    context.registry.addVariableDeclaration((VariableDeclaration node) {
      final VariableElement? element = node.declaredElement;
      if (element == null || !element.declaration.isPublic || pascalCaseRegex.hasMatch(element.name)) {
        return;
      }

      reporter.reportErrorForElement(code, element);
    });
  }

  @override
  List<Fix> getFixes() => [];
}