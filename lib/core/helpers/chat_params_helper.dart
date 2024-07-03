import '../utils/enums/user_type.dart';

abstract class ChatParamsHelper {
  static String conversationId({
    required String otherId,
    required int otherUserType,
    required String currentUserId,
    required int currentUserType,
  }) {
    final otherUserId = otherId.replaceAll("-", "");

    if (currentUserType == UserType.user.id) {
      return "$currentUserId-$otherUserId";
    } else if (currentUserType == UserType.serviceProvider.id) {
      if (otherUserType == UserType.user.id) {
        return "$otherUserId-$currentUserId";
      } else {
        return "$currentUserId-$otherUserId";
      }
    } else {
      if (otherUserType == UserType.user.id) {
        return "$otherUserId-$currentUserId";
      } else {
        return "$currentUserId-$otherUserId";
      }
    }
  }
}
