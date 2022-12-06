import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:logging/logging.dart';

/// Emits out one or all the current variables to the logs.
class LogVariablesStep extends TestRunnerStep {
  LogVariablesStep({
    this.logLevel,
    this.variableName,
  });

  static const id = 'log_variables';

  static final Logger _logger = Logger('LogVeriablesStep');

  static List<String> get behaviorDrivenDescriptions => List.unmodifiable([
        'log the `{{variableName}}` using the `{{logLevel}}` level.',
        'log all variables using the `{{logLevel}}` level.',
      ]);

  /// The log level to use when writing the variables out.  As a note, the
  /// default level that the framework listens for is INFO, so you may need to
  /// change that level if you use more fine levels here.
  final String? logLevel;

  /// The name of the variable to log out.  If set, only this specific variable
  /// will be logged.  Otherwise, all variables will be logged.
  final String? variableName;

  @override
  String get stepId => id;

  /// Creates an instance from a JSON-like map structure.  This expects the
  /// following format:
  ///
  /// ```json
  /// {
  ///   "logLevel": <String>,
  ///   "variableName": <String>
  /// }
  /// ```
  static LogVariablesStep? fromDynamic(dynamic map) {
    LogVariablesStep? result;

    if (map != null) {
      result = LogVariablesStep(
        logLevel: map['logLevel'],
        variableName: map['variableName'],
      );
    }

    return result;
  }

  /// Executes the step.  This emit all the current variables using the
  /// appropriate [level].  If [level] is not set, or set to an invalid value,
  /// this will
  @override
  Future<void> execute({
    required CancelToken cancelToken,
    required TestReport report,
    required TestController tester,
  }) async {
    final logLevel = tester.resolveVariable(this.logLevel);
    final variableName = tester.resolveVariable(this.variableName);

    final name = "log_variables('$logLevel', '$variableName')";
    log(
      name,
      tester: tester,
    );

    final variables = tester.variables;
    Level level;

    switch (logLevel?.toLowerCase()) {
      case 'config':
        level = Level.CONFIG;
        break;

      case 'fine':
        level = Level.FINE;
        break;

      case 'finer':
        level = Level.FINER;
        break;

      case 'finest':
        level = Level.FINEST;
        break;

      case 'severe':
        level = Level.SEVERE;
        break;

      case 'shout':
        level = Level.SHOUT;
        break;

      case 'warning':
        level = Level.WARNING;
        break;

      default:
        level = Level.INFO;
    }

    if (variableName?.isNotEmpty == true) {
      final value = tester.getVariable(variableName);
      _logger.log(
        level,
        'variable: [$variableName] = [$value]',
      );
    } else {
      variables.forEach((key, value) {
        _logger.log(
          level,
          'variable: [$key] = [$value]',
        );
      });
    }
  }

  @override
  String getBehaviorDrivenDescription(TestController tester) {
    var result = variableName == null
        ? behaviorDrivenDescriptions[1]
        : behaviorDrivenDescriptions[0];

    result = result.replaceAll('{{logLevel}}', logLevel ?? 'info');
    result = result.replaceAll('{{variableName}}', variableName ?? 'null');

    return result;
  }

  @override
  Future<void> postStepSleep(_) async => null;

  @override
  Future<void> preStepSleep(_) async => null;

  /// Converts this to a JSON compatible map.  For a description of the format,
  /// see [fromDynamic].
  @override
  Map<String, dynamic> toJson() => {
        'logLevel': logLevel,
        'variableName': variableName,
      };
}
