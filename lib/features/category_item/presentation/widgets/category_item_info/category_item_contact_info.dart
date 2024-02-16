part of 'category_item_info_section.dart';

class _CategoryItemContactInfo extends StatelessWidget {
  const _CategoryItemContactInfo({
    required this.contactInfo,
  });
  final List<String> contactInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(contactInfo.length, (index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: _ContactRow(phone: contactInfo[index]),
        );
      }),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.phone,
  });

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppSvg.phone,
          color: Theme.of(context).cardColor,
        ),
        const SizedBox(width: 15),
        Text(
          phone,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: AppFontSize.details,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
