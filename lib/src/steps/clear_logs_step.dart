import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// Clears all logs from the current [TestReport].
class ClearLogsStep extends TestRunnerStep {
  /// Creates an instance from a JSON-like map structure.  This expects the
  /// following format:
  ///
  /// ```json
  /// {
  /// }
  /// ```
  static ClearLogsStep fromDynamic(dynamic map) {
    ClearLogsStep result;

    if (map != null) {
      result = ClearLogsStep();
    }

    return result;
  }

  /// Executes the step.  This will clear all the logs from the test report.
  @override
  Future<void> execute({
    @required CancelToken cancelToken,
    @required TestReport report,
    @required TestController tester,
  }) async {
    var name = 'clear_logs()';
    log(
      name,
      tester: tester,
    );
    report?.logs?.clear();
  }

  @override
  Future<void> postStepSleep(_) async => null;

  @override
  Future<void> preStepSleep(_) async => null;

  /// Converts this to a JSON compatible map.  For a description of the format,
  /// see [fromDynamic].
  @override
  Map<String, dynamic> toJson() => {};
}
