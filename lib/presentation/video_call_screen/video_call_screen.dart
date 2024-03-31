import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:health_care_app/core/app_export.dart';

import '../../widgets/custom_icon_button.dart';

class VideoCallScreen extends StatelessWidget {
  final String imagePath;

  const VideoCallScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            image: DecorationImage(
              image: NetworkImage(imagePath), // Use the received image path
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: 270.h,
            margin: EdgeInsets.only(left: 65.h),
            decoration: AppDecoration.gradientBlackToBlack,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage,
                  width: 75.h,
                  radius: BorderRadius.circular(
                    15.h,
                  ),
                  alignment: Alignment.centerRight,
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 33.h),
                  child: Text(
                    "Dr. Marcus Horizon",
                    style: CustomTextStyles.titleMediumWhiteA700,
                  ),
                ),
                SizedBox(height: 8.v),
                Padding(
                  padding: EdgeInsets.only(left: 73.h),
                  child: Text(
                    "00:05:24",
                    style: CustomTextStyles.titleSmallWhiteA700,
                  ),
                ),
                SizedBox(height: 21.v),
                _buildCallActions(context),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: _buildSwipeBackToMenu(context),
      ),
    );
  }

  Widget _buildCallActions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 64.h),
      child: Row(
        children: [
          CustomIconButton(
            onTap: () {
              Navigator.pop(context);
            },
            height: 52.adaptSize,
            width: 52.adaptSize,
            padding: EdgeInsets.all(14.h),
            decoration: IconButtonStyleHelper.fillRed,
            child: CustomImageView(
              imagePath: ImageConstant.imgUpload,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.h),
            child: CustomIconButton(
              height: 52.adaptSize,
              width: 52.adaptSize,
              padding: EdgeInsets.all(14.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgCall,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.h),
            child: CustomIconButton(
              height: 52.adaptSize,
              width: 52.adaptSize,
              padding: EdgeInsets.all(14.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgMenu,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
