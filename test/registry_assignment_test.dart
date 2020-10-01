import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:automated_testing_framework_plugin_logging/automated_testing_framework_plugin_logging.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clear_logs', () {
    TestLoggingHelper.registerTestSteps();
    var availStep = TestStepRegistry.instance.getAvailableTestStep(
      'clear_logs',
    );

    expect(availStep.form.runtimeType, ClearLogsForm);
    expect(
      availStep.help,
      TestLoggingTranslations.atf_logging_help_clear_logs,
    );
    expect(availStep.id, 'clear_logs');
    expect(
      availStep.title,
      TestLoggingTranslations.atf_logging_title_clear_logs,
    );
    expect(availStep.type, null);
    expect(availStep.widgetless, true);
  });

  test('log_scanner', () {
    TestLoggingHelper.registerTestSteps();
    var availStep = TestStepRegistry.instance.getAvailableTestStep(
      'log_scanner',
    );

    expect(availStep.form.runtimeType, LogScannerForm);
    expect(
      availStep.help,
      TestLoggingTranslations.atf_logging_help_log_scanner,
    );
    expect(availStep.id, 'log_scanner');
    expect(
      availStep.title,
      TestLoggingTranslations.atf_logging_title_log_scanner,
    );
    expect(availStep.type, null);
    expect(availStep.widgetless, true);
  });

  test('log_variables', () {
    TestLoggingHelper.registerTestSteps();
    var availStep = TestStepRegistry.instance.getAvailableTestStep(
      'log_variables',
    );

    expect(availStep.form.runtimeType, LogVariablesForm);
    expect(
      availStep.help,
      TestLoggingTranslations.atf_logging_help_log_variables,
    );
    expect(availStep.id, 'log_variables');
    expect(
      availStep.title,
      TestLoggingTranslations.atf_logging_title_log_variables,
    );
    expect(availStep.type, null);
    expect(availStep.widgetless, true);
  });

  test('mask_logs', () {
    TestLoggingHelper.registerTestSteps();
    var availStep = TestStepRegistry.instance.getAvailableTestStep(
      'mask_logs',
    );

    expect(availStep.form.runtimeType, MaskLogsForm);
    expect(
      availStep.help,
      TestLoggingTranslations.atf_logging_help_mask_logs,
    );
    expect(availStep.id, 'mask_logs');
    expect(
      availStep.title,
      TestLoggingTranslations.atf_logging_title_mask_logs,
    );
    expect(availStep.type, null);
    expect(availStep.widgetless, true);
  });
}
