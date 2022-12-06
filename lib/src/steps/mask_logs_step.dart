import 'package:automated_testing_framework/automated_testing_framework.dart';

/// Scans the log records in the current test report will mask all matches to
/// the set [regEx] using [mask].
class MaskLogsStep extends TestRunnerStep {
  MaskLogsStep({
    this.mask,
    required this.regEx,
  });

  static const id = 'mask_logs';

  static List<String> get behaviorDrivenDescriptions => List.unmodifiable([
        'mask all instances of the `{{regEx}}` regular expession using `{{mask}}` as the masking character.',
      ]);

  /// The masking character to use.
  final String? mask;

  /// The Regular Expression to scan for.
  final String regEx;

  @override
  String get stepId => id;

  /// Creates an instance from a JSON-like map structure.  This expects the
  /// following format:
  ///
  /// ```json
  /// {
  ///   "mask": <String>,
  ///   "regEx": <String>
  /// }
  /// ```
  static MaskLogsStep? fromDynamic(dynamic map) {
    MaskLogsStep? result;

    if (map != null) {
      result = MaskLogsStep(
        mask: map['mask'],
        regEx: map['regEx']!,
      );
    }

    return result;
  }

  /// Executes the step.  This will scan all log entries and fail if at least
  /// one matches the given [regEx] value.
  @override
  Future<void> execute({
    required CancelToken cancelToken,
    required TestReport report,
    required TestController tester,
  }) async {
    String? mask = tester.resolveVariable(this.mask);
    final regEx = tester.resolveVariable(this.regEx);

    /// Do not emit out the regex as it may be sensitive, which is probably why
    /// it's being masked in the first place.
    final name = "mask_logs('$mask')";
    log(
      name,
      tester: tester,
    );

    if (mask?.isNotEmpty == true) {
      mask = mask!.substring(0, 1);
    } else {
      mask = '*';
    }

    final re = RegExp(regEx);
    var index = 0;
    for (var line in report.logs) {
      if (re.hasMatch(line) == true) {
        var replacement = line;
        re.allMatches(line).forEach((match) {
          final end = match.end;
          final start = match.start;

          final length = end - start;

          replacement = replacement.substring(0, start) +
              ''.padLeft(length, mask!) +
              replacement.substring(end, replacement.length);
        });
        report.logs[index] = replacement;
      }
      index++;
    }
  }

  @override
  String getBehaviorDrivenDescription(TestController tester) {
    var result = behaviorDrivenDescriptions[0];

    result = result.replaceAll('{{regEx}}', regEx);
    result = result.replaceAll(
      '{{mask}}',
      mask?.isNotEmpty == true ? mask!.substring(0, 1) : '*',
    );

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
        'regEx': regEx,
      };
}
