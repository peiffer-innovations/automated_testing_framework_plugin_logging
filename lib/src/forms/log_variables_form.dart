import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:automated_testing_framework_plugin_logging/automated_testing_framework_plugin_logging.dart';
import 'package:flutter/material.dart';
import 'package:static_translations/static_translations.dart';

class LogVariablesForm extends TestStepForm {
  const LogVariablesForm();

  @override
  bool get supportsMinified => true;

  @override
  TranslationEntry get title =>
      TestLoggingTranslations.atf_logging_title_log_variables;

  @override
  Widget buildForm(
    BuildContext context,
    Map<String, dynamic> values, {
    bool minify = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (minify != true)
          buildHelpSection(
            context,
            TestLoggingTranslations.atf_logging_help_log_variables,
            minify: minify,
          ),
        buildValuesSection(
          context,
          [
            buildDropdown(
              context: context,
              defaultValue: 'info',
              id: 'logLevel',
              items: [
                'fine',
                'finer',
                'finest',
                'config',
                'info',
                'warning',
                'severe',
                'shout',
              ],
              label: TestLoggingTranslations.atf_form_logging_log_level,
              values: values,
            ),
            SizedBox(height: 16.0),
            buildEditText(
              context: context,
              id: 'variableName',
              label: TestStepTranslations.atf_form_variable_name,
              values: values,
            ),
          ],
          minify: minify,
        ),
      ],
    );
  }
}
