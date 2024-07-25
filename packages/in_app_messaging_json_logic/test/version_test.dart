import 'package:in_app_messaging_json_logic/in_app_messaging_json_logic.dart';
import 'testcase.dart';
import 'package:test/test.dart';

void versiontimeTests(JsonLogic jl) {
  var cases = <TestCase>[
    // Test cases for version comparisons
    TestCase('version ==', r'{"==": [{"var": "version_str1"}, "1.0.0"]}',
        r'{"version_str1":"1.0.0"}', true),
    TestCase('version !=', r'{"!=": [{"var": "version_str1"}, "1.1.0"]}',
        r'{"version_str1":"1.0.0"}', true),
    TestCase('version <', r'{"<": [{"var": "version_str1"}, "1.1.0"]}',
        r'{"version_str1":"1.0.0"}', true),
    TestCase('version <=', r'{"<=": [{"var": "version_str1"}, "1.0.0"]}',
        r'{"version_str1":"1.0.0"}', true),
    TestCase('version >', r'{">": [{"var": "version_str1"}, "0.9.9"]}',
        r'{"version_str1":"1.0.0"}', true),
    TestCase('version >=', r'{">=": [{"var": "version_str1"}, "1.0.0"]}',
        r'{"version_str1":"1.0.0"}', true),
    TestCase(
        'current version compare',
        r'{"!=": [{"var": "version_str1"},{"version.current": []}]}',
        r'{"version_str1":"1.2.5", "current_version":"1.2.0"}',
        true),

    // Test cases for version manipulations
    // TODO(@melvspace): 07/24/24 add increment/decrement by major, minor and patch
  ];

  runTestcases(jl, cases, runMode: false);
}

void main() {
  var jl = JsonLogic();
  group('version cases', () => versiontimeTests(jl));
}
