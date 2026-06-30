import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in_app_messaging_drift/src/data/converters/converters.dart';
import 'package:test/test.dart';

void main() {
  group('Drift converters', () {
    test('JSON map converter round-trips maps', () {
      const converter = DBC.json;
      final value = {
        'id': '1',
        'nested': {'enabled': true},
      };

      expect(converter.fromSql(converter.toSql(value)), value);
    });

    test('JSON list converter round-trips typed map lists', () {
      const converter = DBC.jsonArray;
      final value = [
        {'id': '1'},
        {'id': '2', 'active': true},
      ];

      final result = converter.fromSql(converter.toSql(value));

      expect(result, value);
      expect(result, isA<List<Map<String, dynamic>>>());
    });

    test('JSON converters reject invalid JSON', () {
      expect(() => DBC.json.fromSql('{'), throwsA(isA<FormatException>()));
      final decodedList = DBC.jsonArray.fromSql(jsonEncode([1]));
      expect(
        () => decodedList.first,
        throwsA(isA<TypeError>()),
      );
    });

    test('duration converter stores microseconds', () {
      const converter = DBC.duration;
      const value = Duration(milliseconds: 2, microseconds: 3);

      expect(converter.toSql(value), 2003);
      expect(converter.fromSql(2003), value);
    });

    test('color converter round-trips ARGB values', () {
      const converter = DBC.color;
      const value = Color(0xFF336699);

      expect(converter.fromSql(converter.toSql(value)), value);
    });

    test('nullable color list converter round-trips null entries', () {
      const converter = DBC.colors;
      const value = [Color(0xFF000000), null, Color(0xFFFFFFFF)];

      expect(converter.fromSql(converter.toSql(value)), value);
    });
  });
}
