import 'package:in_app_messaging_json_logic/src/version.dart';
import 'package:version/version.dart';

import 'datetime.dart';
import 'interface.dart';
import 'numeric.dart';
import 'truth.dart';
import 'string.dart';

/// Returns the value for the first truthy condition in a JsonLogic `if` rule.
dynamic ifOperator(Applier applier, dynamic data, List params) {
  while (true) {
    if (params.isEmpty) return null;
    if (params.length == 1) {
      return applier(params[0], data);
    }
    var cond = applier(params[0], data);
    if (truth(cond)) {
      return applier(params[1], data);
    } else if (params.length < 2) {
      return null;
    }
    params = params.sublist(2);
  }
}

/// Whether the first two parameters are equal after JsonLogic-style coercion.
bool isEqual(Applier applier, dynamic data, List params) {
  if (params.isEmpty) {
    return false;
  }
  if (params.length == 1) {
    return applier(params[0], data) == null;
  }
  var v1 = applier(params[0], data);
  var v2 = applier(params[1], data);

  if (v1 is List || v2 is List) {
    return compareContent(v1, v2);
  }

  if (getDateTime(v1) is DateTime) {
    return isDateTimeEqualOperator(applier, data, params);
  } else if (getVersion(v1) is Version) {
    return isVersionEqualOperator(applier, data, params);
  }

  if (v1 is String || v2 is String) {
    return toString(v1) == toString(v2);
  }
  if (v1 is bool || v2 is bool) {
    return truth(v1) == truth(v2);
  }

  return v1 == v2;
}

/// Whether [first] and [second] are equal when list values are normalized.
bool compareContent(dynamic first, dynamic second) {
  if (first is List && second is List) {
    return listEquals(first, second);
  } else if (first is List) {
    return listEquals(first, [second]);
  } else if (second is List) {
    return listEquals([first], second);
  }
  return false;
}

/// Whether nullable lists [a] and [b] contain the same ordered values.
bool listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) {
    return b == null;
  }
  if (b == null || a.length != b.length) {
    return false;
  }
  if (identical(a, b)) {
    return true;
  }
  for (int index = 0; index < a.length; index += 1) {
    if (a[index] != b[index]) {
      return false;
    }
  }
  return true;
}

/// Returns loose equality for the first two parameters.
dynamic equalOperator(Applier applier, dynamic data, List params) {
  return isEqual(applier, data, params);
}

/// Returns loose inequality for the first two parameters.
dynamic notEqualOperator(Applier applier, dynamic data, List params) {
  return !isEqual(applier, data, params);
}

/// Returns strict equality for the first two evaluated parameters.
dynamic strictEqualOperator(Applier applier, dynamic data, List params) {
  if (params.isEmpty) {
    return false;
  }
  if (params.length == 1) {
    return applier(params[0], data) == null;
  }
  var v1 = applier(params[0], data);
  var v2 = applier(params[1], data);
  return v1 == v2;
}

/// Returns strict inequality for the first two evaluated parameters.
dynamic strictNEOperator(Applier applier, dynamic data, List params) {
  if (params.isEmpty) {
    return false;
  }
  if (params.length == 1) {
    return applier(params[0], data) != null;
  }
  var v1 = applier(params[0], data);
  var v2 = applier(params[1], data);
  return v1 != v2;
}

/// Returns the negated JsonLogic truthiness of the first parameter.
dynamic notOperator(Applier applier, dynamic data, List params) {
  if (params.isEmpty) {
    return false;
  }
  var v = applier(params[0], data);
  return !truth(v);
}

/// Returns the JsonLogic truthiness of the first parameter.
dynamic notNotOperator(Applier applier, dynamic data, List params) {
  if (params.isEmpty) {
    return false;
  }
  var v = applier(params[0], data);
  return truth(v);
}

/// Returns the first truthy value, or the last evaluated value.
dynamic orOperator(Applier applier, dynamic data, List params) {
  dynamic v;
  for (var p in params) {
    v = applier(p, data);
    if (truth(v)) return v;
  }
  return v;
}

/// Returns the first falsy value, or the last evaluated value.
dynamic andOperator(Applier applier, dynamic data, List params) {
  dynamic v;
  for (var p in params) {
    v = applier(p, data);
    if (!truth(v)) return v;
  }
  return v;
}

/// Returns true only when every parameter evaluates truthy.
dynamic andBoolOperator(Applier applier, dynamic data, List params) {
  dynamic v;
  for (var p in params) {
    v = applier(p, data);
    if (!truth(v)) return false;
  }
  return true;
}

/// Chooses date, version, or numeric comparison based on the first parameter.
dynamic determineAndApplyComparison(
  Applier applier,
  dynamic data,
  List params, {
  required Function dateTimeOperator,
  required Function versionOperator,
  required Function numberOperator,
}) {
  if (params.isEmpty) {
    return false;
  }

  var v1 = applier(params[0], data);
  if (getDateTime(v1) is DateTime) {
    return dateTimeOperator(applier, data, params);
  } else if (getVersion(v1) is Version) {
    return versionOperator(applier, data, params);
  }

  return numberOperator(applier, data, params);
}

/// Returns whether parameters form a strictly increasing sequence.
dynamic lessOperator(Applier applier, dynamic data, List params) {
  return determineAndApplyComparison(
    applier,
    data,
    params,
    dateTimeOperator: dateTimeLessOperator,
    numberOperator: numLessOperator,
    versionOperator: versionLessOperator,
  );
}

/// Returns whether parameters form a non-decreasing sequence.
dynamic lessEqualOperator(Applier applier, dynamic data, List params) {
  return determineAndApplyComparison(
    applier,
    data,
    params,
    dateTimeOperator: dateTimeLessEqualOperator,
    numberOperator: numLessEqualOperator,
    versionOperator: versionLessEqualOperator,
  );
}

/// Returns whether parameters form a strictly decreasing sequence.
dynamic greaterOperator(Applier applier, dynamic data, List params) {
  return determineAndApplyComparison(
    applier,
    data,
    params,
    dateTimeOperator: dateTimeGreaterOperator,
    numberOperator: numGreaterOperator,
    versionOperator: versionGreaterOperator,
  );
}

/// Returns whether parameters form a non-increasing sequence.
dynamic greaterEqualOperator(Applier applier, dynamic data, List params) {
  return determineAndApplyComparison(
    applier,
    data,
    params,
    dateTimeOperator: dateTimeGreaterEqualOperator,
    numberOperator: numGreaterEqualOperator,
    versionOperator: versionGreaterEqualOperator,
  );
}
