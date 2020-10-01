# Test Steps

## Table of Contents

* [Introduction](#introduction)
* [Test Step Summary](#test-step-summary)
* [Details](#details)
  * [clear_logs](#clear_logs)
  * [log_scanner](#log_scanner)
  * [log_variables](#log_variables)
  * [mask_logs](#mask_logs)

## Introduction

This plugin provides a [Test Steps](https://github.com/peiffer-innovations/automated_testing_framework/blob/main/documentation/STEPS.md) related to logging.


---

## Test Step Summary

Test Step IDs                   | Description
--------------------------------|-------------
[clear_logs](#clear_logs)       | Clears all the logs out from the current test report.
[log_scanner](#log_scanner)     | Scans the logs that have been emitted from the current test.
[log_variables](#log_variables) | Logs out one or all variables to the logger.
[mask_logs](#mask_logs)         | Masks a given regular expression int the logs with a defined masking character.


---

## Details

### clear_logs

**How it Works**

1. Clears all logs from the current `TestReport`.


**Example**

```json
{
  "id": "clear_logs",
  "image": "<optional_base_64_image>",
  "values": {
  }
}
```

**Values**

n/a

---

### log_scanner

**How it Works**

1. Scans the logs that have been recording by the current `TestReport` looking for `regEx`
2. If the `regEx` is found in the logs, fails the step; passes otherwise.


**Example**

```json
{
  "id": "log_scanner",
  "image": "<optional_base_64_image>",
  "values": {
    "regEx": "anyValidRegExGoesHere"
  }
}
```

**Values**

Key     | Type   | Required | Supports Variable | Description
--------|--------|----------|-------------------|-------------
`regEx` | String | Yes      | Yes               | The Regular Expression to scan the logs for.


---

### log_variables

**How it Works**

1. Retrieves the variable under `variableName` or all variables if not set.
2. Logs out the values using the `logLevel`.


**Example**

```json
{
  "id": "log_variables",
  "image": "<optional_base_64_image>",
  "values": {
    "logLevel": "finest",
    "variableName": "myVariableName"
  }
}
```

**Values**

Key              | Type   | Required | Supports Variable | Description
-----------------|--------|----------|-------------------|-------------
`logLevel`       | String | No       | Yes               | The log level to write the variables to.  Defaults to `info`.
`myVariableName` | String | No       | Yes               | The optional variable name to log out.  If omitted, all variables will be logged out.


--- 

### mask_logs

**How it Works**

1. Scans the logs that have been recording by the current `TestReport` looking for `regEx`
2. If the `regEx` is found in the logs, fails the step; passes otherwise.


**Example**

```json
{
  "id": "mask_logs",
  "image": "<optional_base_64_image>",
  "values": {
    "mask": "*",
    "regEx": "anyValidRegExGoesHere"
  }
}
```

**Values**

Key     | Type   | Required | Supports Variable | Description
--------|--------|----------|-------------------|-------------
`mask`  | String | No       | Yes               | The character to use whem masking the logs.  If this is empty or omitted then `*` will be used.  If this has more than one character, only the first character will be used.
`regEx` | String | Yes      | Yes               | The Regular Expression to scan the logs for.

