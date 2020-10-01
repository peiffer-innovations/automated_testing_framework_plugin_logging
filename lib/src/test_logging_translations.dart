import 'package:static_translations/static_translations.dart';

class TestLoggingTranslations {
  static const atf_form_logging_log_level = TranslationEntry(
    key: 'atf_form_logging_log_level',
    value: 'Log Level',
  );

  static const atf_form_logging_masking_char = TranslationEntry(
    key: 'atf_form_logging_masking_char',
    value: 'Masking Character',
  );

  static const atf_form_logging_reg_ex = TranslationEntry(
    key: 'atf_logging_reg_ex',
    value: 'Regular Expression',
  );

  static const atf_logging_help_clear_logs = TranslationEntry(
    key: 'atf_logging_help_clear_logs',
    value: 'Clears all the logged values from the current test report.',
  );

  static const atf_logging_help_log_scanner = TranslationEntry(
    key: 'atf_logging_help_log_scanner',
    value:
        'Scans all logs within the current teest report and fails if at least one entry matching the RegEx given.',
  );

  static const atf_logging_help_log_variables = TranslationEntry(
    key: 'atf_logging_help_log_variables',
    value: 'Log all variables from the current controller using a given level.',
  );

  static const atf_logging_help_mask_logs = TranslationEntry(
    key: 'atf_logging_help_mask_logs',
    value:
        'Masks all matches of the given Regular Expression using a specified masking character.',
  );

  static const atf_logging_title_clear_logs = TranslationEntry(
    key: 'atf_logging_title_clear_logs',
    value: 'Clear Logs',
  );

  static const atf_logging_title_log_scanner = TranslationEntry(
    key: 'atf_logging_title_log_scanner',
    value: 'Log Scanner',
  );

  static const atf_logging_title_log_variables = TranslationEntry(
    key: 'atf_logging_title_log_variables',
    value: 'Log Variables',
  );

  static const atf_logging_title_mask_logs = TranslationEntry(
    key: 'atf_logging_title_mask_logs',
    value: 'Mask Logs',
  );
}
