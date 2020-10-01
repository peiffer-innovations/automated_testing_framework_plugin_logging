import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:automated_testing_framework_plugin_logging/automated_testing_framework_plugin_logging.dart';
import 'package:flutter/material.dart';
import 'package:static_translations/static_translations.dart';

class ClearLogsForm extends TestStepForm {
  const ClearLogsForm();

  @override
  bool get supportsMinified => false;

  @override
  TranslationEntry get title =>
      TestLoggingTranslations.atf_logging_title_clear_logs;

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
            TestLoggingTranslations.atf_logging_help_clear_logs,
            minify: minify,
          ),
      ],
    );
  }
}
