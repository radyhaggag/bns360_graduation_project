import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/assets/app_svg.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactWithBottomSheet extends StatelessWidget {
  const ContactWithBottomSheet({
    super.key,
    required this.whatsapp,
    required this.phoneNumber,
  });

  final String? whatsapp;
  final String? phoneNumber;

  static show({
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
            _CallItem(
              phoneNumber: phoneNumber!,
            ),
            const SizedBox(height: 10),
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
    return Container(
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
    );
  }
}

class _WhatsappItem extends StatelessWidget {
  const _WhatsappItem({required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
