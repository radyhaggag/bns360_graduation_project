import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/enums.dart';

extension UserTypeExtension on UserType {
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
