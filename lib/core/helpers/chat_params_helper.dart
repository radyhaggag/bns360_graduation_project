import '../providers/app_provider.dart';
import '../utils/enums/user_type.dart';

abstract class ChatParamsHelper {
  static String conversationId({
    required String otherId,
    required int otherUserType,
  }) {
    final currentUser = AppProvider().getProfile();
    final currentUserId = currentUser?.id.replaceAll("-", "");
    final otherUserId = otherId.replaceAll("-", "");

    if (currentUser?.userType == UserType.user.id) {
      return "$currentUserId-$otherUserId";
    } else if (currentUser?.userType == UserType.serviceProvider.id) {
      if (otherUserType == UserType.user.id) {
        return "$otherUserId-$currentUserId";
      } else {
        return "$currentUserId-$otherUserId";
      }
    } else {
      return "$otherUserId-$currentUserId";
    }
  }
}
