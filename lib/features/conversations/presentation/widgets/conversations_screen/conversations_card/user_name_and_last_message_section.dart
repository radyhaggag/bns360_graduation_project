part of 'conversations_card.dart';

class _UserNameAndLastMessageSection extends StatelessWidget {
  const _UserNameAndLastMessageSection({
    required this.userName,
    required this.lastMessage,
  });

  final String userName;
  final String lastMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: AppFontSize.details,
                  ),
            ),
          ),
          SizedBox(height: 4.h),
          Flexible(
            child: Text(
              lastMessage,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor.withOpacity(.4),
                    fontSize: AppFontSize.light,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
