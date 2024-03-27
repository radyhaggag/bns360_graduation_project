import 'package:flutter/material.dart';

import '../../../../../core/widgets/icons/rounded_icon_btn.dart';

class SaveJobBtn extends StatefulWidget {
  const SaveJobBtn({
    super.key,
    this.isSaved,
  });

  final bool? isSaved;

  @override
  State<SaveJobBtn> createState() => SaveJobBtnState();
}

class SaveJobBtnState extends State<SaveJobBtn> {
  late bool isSaved;
  late bool useSetStateToChangeColor;

  @override
  void initState() {
    super.initState();
    isSaved = widget.isSaved ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return RoundedIconBtn(
      icon: Icon(
        isSaved ? Icons.save : Icons.save_outlined,
        color: isSaved ? Colors.yellow : null,
      ),
      onPressed: () {
        setState(() => isSaved = !isSaved);
      },
      addMargin: true,
    );
  }
}
