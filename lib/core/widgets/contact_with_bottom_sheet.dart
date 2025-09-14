import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';
import '../utils/app_colors.dart';
import '../utils/assets/app_svg.dart';
import '../utils/extensions/context.dart';
import 'buttons/custom_buttons.dart';

class ContactWithBottomSheet extends StatelessWidget {
  const ContactWithBottomSheet({
    super.key,
    required this.whatsapp,
    required this.phoneNumber,
  });

  final String? whatsapp;
  final String? phoneNumber;

  static void show({
    required BuildContext context,
    String? whatsapp,
    String? phoneNumber,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BottomSheet(
        onClosing: () {},
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (context) => ContactWithBottomSheet(
          whatsapp: whatsapp,
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }

  List<String> get phones {
    if (phoneNumber == null) return [];
    if (phoneNumber!.contains("-")) {
      return phoneNumber!.split("- ");
    }
    return [phoneNumber!];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (whatsapp != null) ...[
            _WhatsappItem(
              phoneNumber: whatsapp!,
            ),
            const SizedBox(height: 10),
          ],
          if (phoneNumber != null) ...[
            for (final phone in phones) ...[
              _CallItem(
                phoneNumber: phone,
              ),
              const SizedBox(height: 10),
            ],
          ],
          CustomElevatedButton(
            label: S.of(context).cancel,
            onPressed: () {
              Navigator.pop(context);
            },
            height: 50.h,
            borderRadius: BorderRadius.circular(8),
            backgroundColor: context.theme.highlightColor,
            foregroundColor: AppColors.red,
          ),
        ],
      ),
    );
  }
}

class _CallItem extends StatelessWidget {
  const _CallItem({required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse("tel://$phoneNumber"));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: context.theme.highlightColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50.h,
        child: Row(
          children: [
            Icon(
              Icons.call,
              // FeatherIcons.phoneCall,
              color: AppColors.primary,
              size: 35.r,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                "${S.of(context).call} $phoneNumber",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WhatsappItem extends StatelessWidget {
  const _WhatsappItem({required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse("https://wa.me/$phoneNumber"));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: context.theme.highlightColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50.h,
        child: Row(
          children: [
            SvgPicture.asset(
              AppSvg.whatsapp,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                S.of(context).send_message,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
