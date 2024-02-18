import 'package:equatable/equatable.dart';

class UnreadCountEntity extends Equatable {
  final String userId;
  final int count;

  const UnreadCountEntity({
    required this.userId,
    required this.count,
  });

  UnreadCountEntity copyWith(int? count) {
    return UnreadCountEntity(
      userId: userId,
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props => [userId, count];
}
