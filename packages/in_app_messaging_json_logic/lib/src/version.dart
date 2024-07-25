import 'package:version/version.dart';

import 'interface.dart';
import 'numeric.dart';

Version? getVersion(dynamic arg) {
  if (arg == null) {
    return null;
  } else if (arg is Version) {
    return arg;
  } else if (arg is String && !isNumber(arg)) {
    try {
      return Version.parse(arg);
    } on FormatException {
      return null;
    }
  }

  return null;
}

dynamic reduceOperateVersion(
  Version? Function(Version dt1, Version dt2) operation,
  Applier applier,
  dynamic data,
  List params,
) {
  // This variable will hold the result of the last successful operation or the first Version.
  Version? result;

  for (var param in params) {
    var value = applier(param, data);
    var currentVersion = getVersion(value);

    // If the current value is not a valid Version, return null to indicate failure.
    if (currentVersion == null) {
      return null;
    }

    if (result != null) {
      result = operation(result, currentVersion);

      if (result == null) {
        return null;
      }
    } else {
      // Initialize result with the first valid Version.
      result = currentVersion;
    }
  }

  return result;
}

bool versionGreaterOperator(Applier applier, dynamic data, List params) {
  var r = reduceOperateVersion(
    (a, b) => a > b ? b : null,
    applier,
    data,
    params,
  );
  return r != null;
}

bool versionGreaterEqualOperator(Applier applier, dynamic data, List params) {
  var r = reduceOperateVersion(
    (a, b) => a >= b ? b : null,
    applier,
    data,
    params,
  );
  return r != null;
}

bool versionLessOperator(Applier applier, dynamic data, List params) {
  var r = reduceOperateVersion(
    (a, b) => a < b ? b : null,
    applier,
    data,
    params,
  );
  return r != null;
}

bool versionLessEqualOperator(Applier applier, dynamic data, List params) {
  var r = reduceOperateVersion(
    (a, b) => a <= b ? b : null,
    applier,
    data,
    params,
  );
  return r != null;
}

bool isVersionEqualOperator(Applier applier, dynamic data, List params) {
  var r = reduceOperateVersion(
    (a, b) => a == b ? b : null,
    applier,
    data,
    params,
  );
  return r != null;
}

dynamic currentVersionOperator(Applier applier, dynamic data, List params) {
  Version? current = getVersion(data['current_version']!);
  if (current == null) return null;

  return current;
}
