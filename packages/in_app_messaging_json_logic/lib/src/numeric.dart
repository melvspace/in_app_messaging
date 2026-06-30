import 'package:in_app_messaging_json_logic/src/datetime.dart';
import 'package:in_app_messaging_json_logic/src/version.dart';
import 'package:version/version.dart';

import 'interface.dart';

/// Parses numeric values accepted by arithmetic operators.
num? getNumber(dynamic arg) {
  if (arg is num) {
    return arg;
  } else if (arg is String) {
    try {
      return double.parse(arg);
    } on FormatException {
      return null;
    }
  }
  return null;
}

/// Whether [str] can be parsed as a number.
bool isNumber(String str) {
  num? number = num.tryParse(str);
  return number != null;
}

/// Chooses date, version, or numeric arithmetic from the first parameter.
dynamic determineAndApplyOperation(
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

/// Applies [op] after parsing the first two parameters as numbers.
dynamic binaryOperate(dynamic Function(num n1, num n2) op, Applier applier,
    dynamic data, List params) {
  if (params.length <= 1) {
    return null;
  }

  var v1 = applier(params[0], data);
  var v2 = applier(params[1], data);

  var n1 = getNumber(v1);
  var n2 = getNumber(v2);
  if (n1 == null || n2 == null) {
    return null;
  }
  return op(n1, n2);
}

/// Folds all parameters as numbers, returning null if any value is non-numeric.
dynamic reduceOperate(num Function(num n1, num n2) op, Applier applier,
    dynamic data, List params, num zero) {
  var r = zero;
  for (var p in params) {
    var v = applier(p, data);
    var n = getNumber(v);
    if (n == null) {
      return null;
    }
    r = op(r, n);
    if (r.isNaN) {
      break;
    }
  }
  return r;
}

/// Adds all numeric parameters, starting at zero.
dynamic numAddOperator(Applier applier, dynamic data, List params) {
  return reduceOperate((a, b) => a + b, applier, data, params, 0.0);
}

/// Adds numbers or shifts dates, depending on the first parameter.
dynamic addOperator(Applier applier, dynamic data, List params) {
  return determineAndApplyOperation(
    applier,
    data,
    params,
    dateTimeOperator: dateAddOperator,
    // TODO(@melvspace): 07/24/24 implement version increments
    versionOperator: (applier, data, params) => null,
    numberOperator: numAddOperator,
  );
}

/// Multiplies all numeric parameters, starting at one.
dynamic mulOperator(Applier applier, dynamic data, List params) {
  return reduceOperate((a, b) => a * b, applier, data, params, 1.0);
}

/// Negates one numeric parameter or subtracts the second from the first.
dynamic numSubOperator(Applier applier, dynamic data, List params) {
  if (params.length == 1) {
    var v = applier(params[0], data);
    var n = getNumber(v);
    if (n == null) {
      return null;
    }
    return -n;
  }
  return binaryOperate((a, b) => a - b, applier, data, params);
}

/// Subtracts numbers or shifts dates backward.
dynamic subOperator(Applier applier, dynamic data, List params) {
  return determineAndApplyOperation(
    applier,
    data,
    params,
    dateTimeOperator: dateSubtractOperator,
    // TODO(@melvspace): 07/24/24 implement version increments
    versionOperator: (applier, data, params) => null,
    numberOperator: numSubOperator,
  );
}

/// Divides the first numeric parameter by the second.
dynamic divOperator(Applier applier, dynamic data, List params) {
  return binaryOperate((a, b) => a / b, applier, data, params);
}

/// Returns the remainder of the first numeric parameter divided by the second.
dynamic modOperator(Applier applier, dynamic data, List params) {
  return binaryOperate((a, b) => a % b, applier, data, params);
}

/// Returns whether numeric parameters form a strictly decreasing sequence.
dynamic numGreaterOperator(Applier applier, dynamic data, List params) {
  var r = reduceOperate(
      (a, b) => a > b ? b : double.nan, applier, data, params, double.infinity);
  if (r == null) return false;
  return !r.isNaN;
}

/// Returns whether numeric parameters form a non-increasing sequence.
dynamic numGreaterEqualOperator(Applier applier, dynamic data, List params) {
  var r = reduceOperate((a, b) => a >= b ? b : double.nan, applier, data,
      params, double.infinity);
  if (r == null) return false;
  return !r.isNaN;
}

/// Returns whether numeric parameters form a strictly increasing sequence.
dynamic numLessOperator(Applier applier, dynamic data, List params) {
  var r = reduceOperate((a, b) => a < b ? b : double.nan, applier, data, params,
      -double.infinity);
  if (r == null) return false;
  return !r.isNaN;
}

/// Returns whether numeric parameters form a non-decreasing sequence.
dynamic numLessEqualOperator(Applier applier, dynamic data, List params) {
  var r = reduceOperate((a, b) => a <= b ? b : double.nan, applier, data,
      params, -double.infinity);
  if (r == null) return false;
  return !r.isNaN;
}

/// Returns the largest numeric parameter.
dynamic maxOperator(Applier applier, dynamic data, List params) {
  return reduceOperate(
      (a, b) => a > b ? a : b, applier, data, params, -double.infinity);
}

/// Returns the smallest numeric parameter.
dynamic minOperator(Applier applier, dynamic data, List params) {
  return reduceOperate(
      (a, b) => a < b ? a : b, applier, data, params, double.infinity);
}
