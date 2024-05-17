import 'package:bns360_graduation_project/core/utils/enums/user_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PublisherDetailsEntity extends Equatable {
  final String photoUrl;
  final String name;
  final UserType userType;

  const PublisherDetailsEntity({
    required this.photoUrl,
    required this.name,
    required this.userType,
  });

  @override
  List<Object?> get props => [photoUrl, name, userType];

  String getDescription(BuildContext context) {
    return userType.asPublisherDetailsDescription(context);
  }
}
