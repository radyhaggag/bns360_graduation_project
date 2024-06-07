import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

enum UserType {
  user(0),
  serviceProvider(1),
  businessOwner(2),
  guest(4);

  const UserType(this.id);
  final int id;

  static List<UserType> get signUpTypes => [
        UserType.user,
        UserType.serviceProvider,
        UserType.businessOwner,
      ];

  String getText(BuildContext context) {
    switch (this) {
      case UserType.user:
        return S.of(context).user;
      case UserType.businessOwner:
        return S.of(context).businessOwner;
      case UserType.serviceProvider:
        return S.of(context).serviceProvider;
      case UserType.guest:
        return S.of(context).guest;
    }
  }

  String asPublisherDetailsDescription(BuildContext context) {
    switch (this) {
      case UserType.user:
        return S.of(context).user;
      case UserType.businessOwner:
        return S.of(context).businessOwner;
      case UserType.serviceProvider:
        return S.of(context).serviceProvider;
      case UserType.guest:
        return S.of(context).guest;
    }
  }

  static UserType fromInteger(int value) {
    switch (value) {
      case 0:
        return UserType.user;
      case 1:
        return UserType.serviceProvider;
      case 2:
        return UserType.businessOwner;
      case 3:
        return UserType.guest;
      default:
        return UserType.user;
    }
  }
}
