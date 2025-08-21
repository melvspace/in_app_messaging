import 'package:in_app_messaging_drift/in_app_messaging_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

@Riverpod(keepAlive: true)
InAppMessagingDatabase database(Ref ref) {
  return InAppMessagingDatabase();
}
