import 'package:in_app_messaging_json_logic/in_app_messaging_json_logic.dart';
import 'testcase.dart';
import 'package:test/test.dart';

void stringTests(JsonLogic jl) {
  var cases = <TestCase>[
    TestCase('cat', r'{"cat": ["I love ", {"var":"filling"}, " pie"]}',
        r'{"filling":"apple", "temp":110}', 'I love apple pie'),
    TestCase('substr 1', r'{"substr": ["jsonlogic", 4]}', null, 'logic'),
    TestCase('substr 2', r'{"substr": ["jsonlogic", -5]}', null, 'logic'),
    TestCase('substr 3', r'{"substr": ["jsonlogic", 1, 3]}', null, 'son'),
    TestCase('substr 4', r'{"substr": ["jsonlogic", 4, -2]}', null, 'log'),
    TestCase('log', r'{"log":"apple"}', null, 'apple'),
  ];
  runTestcases(jl, cases, runMode: false);
}

void main() {
  var jl = JsonLogic();
  group('string cases', () => stringTests(jl));
}
