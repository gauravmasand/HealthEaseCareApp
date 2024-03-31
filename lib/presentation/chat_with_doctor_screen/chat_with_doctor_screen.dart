import 'package:health_care_app/presentation/video_call_screen/video_call_screen.dart';
import 'package:health_care_app/widgets/app_bar/custom_app_bar.dart';
import 'package:health_care_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:health_care_app/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:health_care_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:health_care_app/widgets/custom_text_form_field.dart';
import 'package:health_care_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';
import 'package:url_launcher/url_launcher.dart';

import '../message_history_page/widgets/messagehistory_item_widget.dart';

// ignore_for_file: must_be_immutable
// ignore_for_file: must_be_immutable
class ChatWithDoctorScreen extends StatelessWidget {
  ChatWithDoctorScreen({Key? key, required this.doctor}) : super(key: key);

  final doctor;
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 42.v,
          ),
          child: ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              SizedBox(height: 7.v),
              _buildConsultationStart(context),
              SizedBox(height: 20.v),
              _buildDoctorProfile(context),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 90.h),
                child: _buildChatTile(
                  context,
                  healthStatusText:
                  "I have suffering from headache and cold for 3 days, I took 2 tablets of dolo, but still pain",
                ),
              ),
              SizedBox(height: 15.v),
              _buildProfile(
                context,
                doctorName: doctor.doctorsname,
                time: "5 min ago",
              ),
              SizedBox(height: 10.v),
              Container(
                width: 221.h,
                margin: EdgeInsets.only(right: 106.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 13.h,
                  vertical: 5.v,
                ),
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 4.v),
                    Container(
                      width: 186.h,
                      margin: EdgeInsets.only(right: 9.h),
                      child: Text(
                        "Ok, Do you have fever? is the\nheadchace severe",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          height: 1.50,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 90.h),
                child: _buildChatTile(
                  context,
                  healthStatusText:
                  "I don't have any fever, but headache is painful",
                ),
              ),
              SizedBox(height: 15.v),
              _buildProfile(
                context,
                doctorName: doctor.doctorsname,
                time: "Online",
              ),
              SizedBox(height: 10.v),
              Container(
                height: 22.v,
                width: 58.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 13.h,
                  vertical: 8.v,
                ),
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL5,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroup141,
                  height: 5.v,
                  alignment: Alignment.bottomCenter,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: _buildEightyEight(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 46.h,
      leading: AppbarLeadingImage(
        onTap: () {
          Navigator.pop(context);
        },
        imagePath: ImageConstant.imgIconChevronLeft,
        margin: EdgeInsets.only(
          left: 22.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitleThree(
        text: doctor.doctorsname,
        margin: EdgeInsets.only(left: 17.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgUVideo,
          margin: EdgeInsets.only(
            left: 20.h,
            top: 8.v,
            right: 8.h,
          ),
          onTap: () {
            onTapUVideo(context);
          },
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgUPhoneAlt,
          margin: EdgeInsets.only(
            left: 10.h,
            top: 8.v,
            right: 8.h,
          ),
          onTap: () {
            onTapUPhoneAlt(context);
          },
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconChevronLeftOnprimary24x24,
          margin: EdgeInsets.fromLTRB(16.h, 10.v, 28.h, 6.v),
        )
      ],
    );
  }

  Widget _buildDoctorProfile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50.adaptSize,
          backgroundImage: NetworkImage(doctor.profilepic),
        ),
        SizedBox(height: 10.v),
        Text(
          doctor.doctorsname,
          style: CustomTextStyles.titleLargeSemiBold,
        ),
        SizedBox(height: 5.v),
        Text(
          doctor.specialist,
          style: CustomTextStyles.titleSmallPrimary,
        ),
        SizedBox(height: 5.v),
        Text(
          doctor.location,
          style: CustomTextStyles.labelSmallInterWhiteA700,
        ),
        SizedBox(height: 10.v),
        Text(
          doctor.description,
          style: CustomTextStyles.bodySmallBluegray400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildConsultationStart(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 39.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Consultation Start",
            style: CustomTextStyles.titleMediumPrimary,
          ),
          SizedBox(height: 8.v),
          Text(
            "You can consult your problem to the doctor",
            style: theme.textTheme.labelLarge,
          )
        ],
      ),
    );
  }

  Widget _buildEightyEight(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 26.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            width: 207.h,
            controller: messageController,
            hintText: "Type message ...",
            hintStyle: CustomTextStyles.bodyMediumGray500,
            textInputAction: TextInputAction.done,
            suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 15.v, 17.h, 15.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgAttach,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 50.v,
            ),
            contentPadding: EdgeInsets.only(
              left: 19.h,
              top: 16.v,
              bottom: 16.v,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
            filled: true,
            fillColor: appTheme.whiteA700,
          ),
          CustomElevatedButton(
            height: 50.v,
            width: 111.h,
            text: "Send",
            margin: EdgeInsets.only(left: 9.h),
            buttonTextStyle: CustomTextStyles.titleSmallWhiteA700SemiBold,
          )
        ],
      ),
    );
  }

  Widget _buildProfile(
      BuildContext context, {
        required String doctorName,
        required String time,
      }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgClose40x40,
          height: 40.adaptSize,
          width: 40.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 13.h,
            top: 3.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorName,
                style: CustomTextStyles.titleSmallOnPrimary.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: 7.v),
              Text(
                time,
                style: theme.textTheme.labelMedium!.copyWith(
                  color: appTheme.gray500,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildChatTile(
      BuildContext context, {
        required String healthStatusText,
      }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              width: 165.h,
              margin: EdgeInsets.only(
                left: 9.h,
                top: 4.v,
                bottom: 1.v,
              ),
              child: Text(
                healthStatusText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyMediumWhiteA700.copyWith(
                  color: appTheme.whiteA700,
                  height: 1.43,
                ),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgBasicCheckAllBig,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.only(
              left: 36.h,
              top: 30.v,
            ),
          )
        ],
      ),
    );
  }

  onTapUVideo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoCallScreen(
      imagePath: doctor.profilepic,
    )));
  }

  onTapUPhoneAlt(BuildContext context) async {
    String phoneNumber = 'tel:+918767932356';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}