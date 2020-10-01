import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:automated_testing_framework_plugin_logging/automated_testing_framework_plugin_logging.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';
import 'package:static_translations/static_translations.dart';

class LogScannerForm extends TestStepForm {
  const LogScannerForm();

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
            TestLoggingTranslations.atf_logging_help_log_scanner,
            minify: minify,
          ),
        buildValuesSection(
          context,
          [
            buildEditText(
              context: context,
              id: 'regEx',
              label: TestLoggingTranslations.atf_form_logging_reg_ex,
              validators: [
                RequiredValidator(),
              ],
              values: values,
            ),
          ],
          minify: minify,
        ),
      ],
    );
  }
}
