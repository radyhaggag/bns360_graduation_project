import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

enum UserType {
  user(0),
  serviceProvider(1),
  businessOwner(2);

  const UserType(this.id);
  final int id;

  String getText(BuildContext context) {
    switch (this) {
      case UserType.user:
        return S.of(context).user;
      case UserType.businessOwner:
        return S.of(context).businessOwner;
      case UserType.serviceProvider:
        return S.of(context).serviceProvider;
    }
  }
}
