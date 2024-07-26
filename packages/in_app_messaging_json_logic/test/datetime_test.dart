import 'package:in_app_messaging_json_logic/in_app_messaging_json_logic.dart';
import 'testcase.dart';
import 'package:test/test.dart';

void datetimeTests(JsonLogic jl) {
  var cases = <TestCase>[
    // Test cases for date comparisons
    TestCase(
        'date ==',
        r'{"==": [{"var": "date_str1"}, "2011-12-12T00:00:00"]}',
        r'{"date_str1":"2011-12-12T00:00:00"}',
        true),
    TestCase(
        'date !=',
        r'{"!=": [{"var": "date_str1"}, "2011-12-13T00:00:00"]}',
        r'{"date_str1":"2011-12-12T00:00:00"}',
        true),
    TestCase('date <', r'{"<": [{"var": "date_str1"}, "2011-12-13T00:00:00"]}',
        r'{"date_str1":"2011-12-12T00:00:00"}', true),
    TestCase(
        'date <=',
        r'{"<=": [{"var": "date_str1"}, "2011-12-12T00:00:00"]}',
        r'{"date_str1":"2011-12-12T00:00:00"}',
        true),
    TestCase('date >', r'{">": [{"var": "date_str1"}, "2011-12-11T00:00:00"]}',
        r'{"date_str1":"2011-12-12T00:00:00"}', true),
    TestCase(
        'date >=',
        r'{">=": [{"var": "date_str1"}, "2011-12-12T00:00:00"]}',
        r'{"date_str1":"2011-12-12T00:00:00"}',
        true),
    TestCase('now compare', r'{"<=": [{"var": "datetime_str1"},{"now": []}]}',
        r'{"datetime_str1":"2024-02-29T12:30:00"}', true),
    TestCase(
        'current date compare',
        r'{"!=": [{"var": "date_str1"},{"current_date": []}]}',
        r'{"date_str1":"2024-02-28T00:00:00"}',
        true),

    // Test cases for date manipulations
    TestCase(
        'add days',
        r'{"==": [{"var": "date_str1"}, {"+": [{"var": "date_str2"}, 8, "days"]}]}',
        r'{"date_str1": "2024-01-20T00:00:00", "date_str2": "2024-01-12T00:00:00"}',
        true),
    TestCase(
        'subtract days',
        r'{"==": [{"var": "date_str1"}, {"-": [{"var": "date_str2"}, 8, "days"]}]}',
        r'{"date_str1": "2024-01-12T00:00:00", "date_str2": "2024-01-20T00:00:00"}',
        true),
    TestCase(
        'add months',
        r'{"==": [{"var": "date_str1"}, {"+": [{"var": "date_str2"}, 2, "months"]}]}',
        r'{"date_str1": "2024-03-12T00:00:00", "date_str2": "2024-01-12T00:00:00"}',
        true),
    TestCase(
        'subtract months',
        r'{"==": [{"var": "date_str1"}, {"-": [{"var": "date_str2"}, 2, "months"]}]}',
        r'{"date_str1": "2024-01-12T00:00:00", "date_str2": "2024-03-12T00:00:00"}',
        true),
    TestCase(
        'add years',
        r'{"==": [{"var": "date_str1"}, {"+": [{"var": "date_str2"}, 3, "years"]}]}',
        r'{"date_str1": "2027-01-12T00:00:00", "date_str2": "2024-01-12T00:00:00"}',
        true),
    TestCase(
        'add years',
        r'{"==": [{"var": "date_str1"}, {"+": [{"var": "date_str2"}, 3, "years"]}]}',
        r'{"date_str1": "2027-01-12T00:00:00", "date_str2": "2024-01-12T00:00:00"}',
        true),
    TestCase(
        'subtract years',
        r'{"==": [{"var": "date_str1"}, {"-": [{"var": "date_str2"}, 3, "years"]}]}',
        r'{"date_str1": "2024-01-12T00:00:00", "date_str2": "2027-01-12T00:00:00"}',
        true),
    TestCase(
        'subtract years',
        r'{"==": [{"var": "date_str1"}, {"-": [{"var": "date_str2"}, 3, "years"]}]}',
        r'{"date_str1": "2024-01-12T00:00:00", "date_str2": "2027-01-12T00:00:00"}',
        true),
    TestCase(
        'current date add days',
        r'{"<": [{"var": "date_str1"},{"+": [{"current_date": []},5,"days"]}]}',
        r'{"date_str1": "2024-01-12T00:00:00"}',
        true),
    TestCase(
        'now add days',
        r'{"<=": [{"var": "datetime_str1"},{"+": [{"now": []},5,"days"]}]}',
        r'{"datetime_str1": "2024-01-12T12:30:00"}',
        true),
    TestCase(
        'now add days',
        r'{"<=": [{"var": "datetime_str1"},{"+": [{"now": []},5,"days"]}]}',
        r'{"datetime_str1": "2024-01-12T12:30:00"}',
        true),

    TestCase(
      'date.truncate -> true',
      '''{
        "==": [
          {"date.truncate": ["2024-01-12T12:30:00", "days"]},
          "2024-01-12T00:00:00"
        ]
      }''',
      '{}',
      true,
    ),
    TestCase(
      'date.truncate -> false',
      '''{
        "<": [
          {"date.truncate": [{"var": ["interactions.last_seen.date"]}, "days"]},
          {"date.truncate": [{"now": []}, "days"]}
        ]
      }''',
      '{"interactions.last_seen.date": "2024-01-12T00:00:00"}',
      false,
    ),
  ];

  runTestcases(jl, cases, runMode: false);
}

void main() {
  var jl = JsonLogic();
  group('datetime cases', () => datetimeTests(jl));
}
