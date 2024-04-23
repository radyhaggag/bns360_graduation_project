import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/main_network_image.dart';
import '../../../bloc/my_services_bloc.dart';

class EditCraftsmanImageSection extends StatelessWidget {
  const EditCraftsmanImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyServicesBloc, MyServicesState>(
      builder: (context, state) {
        final selectedImage = context.read<MyServicesBloc>().mainServiceImage;
        final currentNetworkImage =
            context.read<MyServicesBloc>().mainNetworkImage;
        return Stack(
          alignment: Alignment.center,
          children: [
            if (selectedImage == null)
              ClipOval(
                child: MainNetworkImage(
                  imageUrl: currentNetworkImage,
                  width: 90.r,
                  height: 90.r,
                ),
              )
            else
              ClipOval(
                child: Image.file(
                  selectedImage,
                  width: 90.r,
                  height: 90.r,
                ),
              ),
            CircleAvatar(
              backgroundColor: context.theme.primaryColor.withOpacity(.25),
              radius: 45.r,
              child: InkWell(
                onTap: () {
                  context.read<MyServicesBloc>().add(
                        AddMainServiceImageEvent(),
                      );
                },
                child: Icon(
                  Icons.camera_alt,
                  size: 25.r,
                  color: context.theme.highlightColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
