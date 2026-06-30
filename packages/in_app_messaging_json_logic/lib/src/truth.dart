/// Whether [v] is truthy according to JsonLogic semantics.
///
/// Null, false, zero, empty strings, empty lists, and empty maps are false.
bool truth(dynamic v) {
  if (v == null) {
    return false;
  } else if (v is bool) {
    return v;
  } else if (v is num) {
    return v != 0;
  } else if (v is String) {
    return v.isNotEmpty;
  } else if (v is List || v is Map) {
    return v.isNotEmpty;
  }
  return true;
}
