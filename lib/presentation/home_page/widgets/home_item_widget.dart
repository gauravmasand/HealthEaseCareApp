import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../doctor_detail_screen/doctor_detail_screen.dart';

class HomeItemWidget extends StatelessWidget {
  final Map<String, dynamic> doctorData;

  const HomeItemWidget(this.doctorData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ocntext) => DoctorDetailScreen(
          doctorData: doctorData,
        )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 0.h,
          vertical: 8.v,
        ),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 82.v,
                margin: EdgeInsets.only(right: 1.h),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      imagePath: doctorData['profilepic'],
                      height: 71.adaptSize,
                      width: 71.adaptSize,
                      fit: BoxFit.cover,
                      radius: BorderRadius.circular(
                        35.h,
                      ),
                      alignment: Alignment.bottomLeft,
                    ).px(10),
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgSignal,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(
                              doctorData['rating'].toString(),
                              style: CustomTextStyles.labelLargeAmber500SemiBold,
                            ),
                          ),
                        ],
                      ),
                    ).px(10),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18.v),
            Text(
              doctorData['doctorsname'],
              style: CustomTextStyles.titleMediumErrorContainer,
              overflow: TextOverflow.ellipsis,
            ).px(10),
            SizedBox(height: 9.v),
            Text(
              doctorData['specialist'],
              style: theme.textTheme.titleSmall,
              overflow: TextOverflow.ellipsis,
            ).px(10),
            SizedBox(height: 5.v),
            Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgLinkedin,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.only(bottom: 4.v),
                ),
                Container(
                  width: 130,
                  padding: EdgeInsets.only(
                    left: 8.h,
                    top: 3.v,
                  ),
                  child: Text(
                    "${doctorData['location']} away",
                    style: theme.textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ).px(10),
          ],
        ),
      ),
    );
  }
}
