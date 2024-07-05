import '../../domain/entity/message_with_context.dart';
import 'in_app_message_lifecycle.dart';

typedef InAppMessageBuilder = InAppMessageLifecycle Function(
    MessageWithContext tuple);
