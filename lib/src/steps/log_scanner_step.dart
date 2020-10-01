import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// Scans the log records in the current test report and fails if a value is
/// found with a given [regEx] value.
class LogScannerStep extends TestRunnerStep {
  LogScannerStep({
    this.regEx,
  });

  /// The Regular Expression to scan for.
  final String regEx;

  /// Creates an instance from a JSON-like map structure.  This expects the
  /// following format:
  ///
  /// ```json
  /// {
  ///   "regEx": <String>
  /// }
  /// ```
  static LogScannerStep fromDynamic(dynamic map) {
    LogScannerStep result;

    if (map != null) {
      result = LogScannerStep(
        regEx: map['regEx'],
      );
    }

    return result;
  }

  /// Executes the step.  This will scan all log entries and fail if at least
  /// one matches the given [regEx] value.
  @override
  Future<void> execute({
    @required TestReport report,
    @required TestController tester,
  }) async {
    var regEx = tester.resolveVariable(this.regEx);

    // So... this is a bit unique.  Do NOT emit the regex out in the log for
    // this because in a sense of irony, if the regex is a plain string,
    // emitting it here will actuall cause the step to fail.  So this log entry
    // can become a self failing problem.
    var name = 'log_scanner(...)';
    log(
      name,
      tester: tester,
    );

    var re = RegExp(regEx);
    for (var line in report.logs) {
      if (re.hasMatch(line) == true) {
        throw Exception(
          'log_scanner: RegEx: [$regEx] -- found in line: [$line]',
        );
      }
    }
  }

  @override
  Future<void> postStepSleep(_) async => null;

  @override
  Future<void> preStepSleep(_) async => null;

  /// Converts this to a JSON compatible map.  For a description of the format,
  /// see [fromDynamic].
  @override
  Map<String, dynamic> toJson() => {
        'regEx': regEx,
      };
}
