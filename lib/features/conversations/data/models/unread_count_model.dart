import '../../domain/entities/unread_count_entity.dart';

class UnreadCountModel extends UnreadCountEntity {
  const UnreadCountModel({
    required super.userId,
    required super.count,
  });

  factory UnreadCountModel.fromMap(Map<String, dynamic> map) {
    return UnreadCountModel(
      userId: map['userId'] as String,
      count: map['count'] as int,
    );
  }
}

extension UnreadCountEntityToMap on UnreadCountEntity {
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'count': count,
    };
  }
}
