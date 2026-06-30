import 'interface.dart';
import 'dart:convert';

/// Coerces values the way string operators expect.
String toString(dynamic v) {
  if (v == null) {
    return '';
  } else if (v is String) {
    return v;
  } else if (v is List || v is Map) {
    return json.encode(v);
  }
  return '$v';
}

/// Concatenates all parameters after string coercion.
dynamic catOperator(Applier applier, dynamic data, List params) {
  var l = params.map((p) {
    var v = applier(p, data);
    return toString(v);
  });
  return l.join();
}

/// Returns a substring with JsonLogic-compatible negative offsets.
dynamic substrOperator(Applier applier, dynamic data, List params) {
  if (params.isEmpty) {
    return '';
  }
  var s = '';
  var start = 0;
  var len = 0;

  var v = applier(params[0], data);
  if (v is String) {
    s = v;
  } else {
    return '';
  }

  if (params.length > 1) {
    var v = applier(params[1], data);
    if (v is int) {
      start = v;
      if (start < 0) {
        start += s.length;
      }
      if (start < 0 || start > s.length) {
        return '';
      }
    } else {
      return s;
    }
  }

  if (params.length > 2) {
    var v = applier(params[2], data);
    if (v is int) {
      len = v;
      if (len < 0) {
        len += s.length - start;
      }
      if (len < 0 || start + len > s.length) {
        len = s.length - start;
      }
      return s.substring(start, start + len);
    }
  } else {
    return s.substring(start);
  }
}

/// Tests a string against a regular expression pattern.
dynamic regexOperator(Applier applier, dynamic data, List params) {
  if (params.length != 2) {
    return false;
  }

  final input = applier(params[0], data);
  final pattern = applier(params[1], data);
  if (input is! String || pattern is! String) {
    return false;
  }

  try {
    return RegExp(pattern).hasMatch(input);
  } on FormatException {
    return false;
  }
}

/// Prints the first parameter and returns it unchanged.
dynamic logOperator(Applier applier, dynamic data, List params) {
  var v = applier(params[0], data);
  print('$v');
  return v;
}
