part of 'category_item_info_section.dart';

class _CategoryItemContactInfo extends StatelessWidget {
  const _CategoryItemContactInfo({
    required this.phoneNumbers,
    this.email,
    this.url,
  });
  final List<String> phoneNumbers;
  final String? email;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          ...List.generate(
              phoneNumbers.length,
              (index) => Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: _ContactRow(
                      phone: phoneNumbers[index],
                      iconPath: AppSvg.phone,
                      onTap: () => launchUrl(
                        Uri.parse("tel:${phoneNumbers[index]}"),
                      ),
                    ),
                  )),
          if (email != null) ...[
            const SizedBox(height: 10),
            _ContactRow(
              phone: email!,
              icon: Icons.email,
              onTap: () => launchUrl(Uri.parse("mailto:$email")),
            ),
          ],
          if (url != null) ...[
            const SizedBox(height: 10),
            _ContactRow(
              phone: S.of(context).visit_website,
              icon: FeatherIcons.link,
              onTap: () => launchUrl(Uri.parse(url!)),
            ),
          ],
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.phone,
    this.iconPath = AppSvg.phone,
    this.icon,
    this.onTap,
  });

  final String phone;
  final IconData? icon;
  final String? iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: context.theme.cardColor.withOpacity(0.5),
            )
          else if (iconPath != null)
            SvgPicture.asset(
              iconPath!,
              color: context.theme.cardColor,
            ),
          const SizedBox(width: 15),
          Flexible(
            child: Text(
              phone,
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: AppFontSize.details,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
