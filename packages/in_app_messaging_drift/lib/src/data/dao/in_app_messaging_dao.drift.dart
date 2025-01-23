// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:in_app_messaging_drift/src/data/database/database.dart' as i1;
import 'package:in_app_messaging_drift/src/data/schema/in_app_message_seen_dates.drift.dart'
    as i2;
import 'package:drift/internal/modular.dart' as i3;
import 'package:in_app_messaging_drift/src/data/schema/in_app_message_interactions.drift.dart'
    as i4;

mixin $InAppMessagingDaoMixin
    on i0.DatabaseAccessor<i1.InAppMessagingDatabase> {
  i2.$InAppMessageSeenDatesTable get inAppMessageSeenDates =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.$InAppMessageSeenDatesTable>(
              'in_app_message_seen_dates');
  i4.$InAppMessageInteractionsTable get inAppMessageInteractions =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i4.$InAppMessageInteractionsTable>(
              'in_app_message_interactions');
}
