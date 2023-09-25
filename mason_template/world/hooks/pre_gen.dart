import 'package:mason/mason.dart';

void run(HookContext context) {
  String className = context.vars['name'];
  final initialParams = "${className.snakeCase}.dart";

  context.vars = {...context.vars, 'initial_params_file_name': initialParams};
  // TODO: add pre-generation logic.
}
