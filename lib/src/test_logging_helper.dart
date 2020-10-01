import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:automated_testing_framework_plugin_logging/automated_testing_framework_plugin_logging.dart';

class TestLoggingHelper {
  /// Registers the test steps to the optional [registry].  If not set, the
  /// default [TestStepRegistry] will be used.
  static void registerTestSteps([TestStepRegistry registry]) {
    (registry ?? TestStepRegistry.instance).registerCustomSteps([
      TestStepBuilder(
        availableTestStep: AvailableTestStep(
          form: ClearLogsForm(),
          help: TestLoggingTranslations.atf_logging_help_clear_logs,
          id: 'clear_logs',
          keys: const {},
          quickAddValues: const {},
          title: TestLoggingTranslations.atf_logging_title_clear_logs,
          widgetless: true,
          type: null,
        ),
        testRunnerStepBuilder: ClearLogsStep.fromDynamic,
      ),
      TestStepBuilder(
        availableTestStep: AvailableTestStep(
          form: LogScannerForm(),
          help: TestLoggingTranslations.atf_logging_help_log_scanner,
          id: 'log_scanner',
          keys: const {
            'regEx',
          },
          quickAddValues: null,
          title: TestLoggingTranslations.atf_logging_title_log_scanner,
          widgetless: true,
          type: null,
        ),
        testRunnerStepBuilder: LogScannerStep.fromDynamic,
      ),
      TestStepBuilder(
        availableTestStep: AvailableTestStep(
          form: LogVariablesForm(),
          help: TestLoggingTranslations.atf_logging_help_log_variables,
          id: 'log_variables',
          keys: const {
            'logLevel',
            'variableName',
          },
          quickAddValues: {'logLevel': 'info'},
          title: TestLoggingTranslations.atf_logging_title_log_variables,
          widgetless: true,
          type: null,
        ),
        testRunnerStepBuilder: LogVariablesStep.fromDynamic,
      ),
      TestStepBuilder(
        availableTestStep: AvailableTestStep(
          form: MaskLogsForm(),
          help: TestLoggingTranslations.atf_logging_help_mask_logs,
          id: 'mask_logs',
          keys: const {
            'regEx',
          },
          quickAddValues: null,
          title: TestLoggingTranslations.atf_logging_title_mask_logs,
          widgetless: true,
          type: null,
        ),
        testRunnerStepBuilder: MaskLogsStep.fromDynamic,
      ),
    ]);
  }
}
