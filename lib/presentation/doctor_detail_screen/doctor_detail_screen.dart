import 'package:health_care_app/widgets/app_bar/custom_app_bar.dart';
import 'package:health_care_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:health_care_app/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:health_care_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:readmore/readmore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:url_launcher/url_launcher.dart';
import '../chat_with_doctor_screen/chat_with_doctor_screen.dart';
import '../doctor_detail_screen/widgets/am_item_widget.dart';
import 'package:health_care_app/widgets/custom_icon_button.dart';
import 'package:health_care_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class DoctorDetailScreen extends StatelessWidget {
  final Map<String, dynamic> doctorData;

  DoctorDetailScreen({Key? key, required this.doctorData}) : super(key: key);

  DateTime selectedDatesFromCalendar1 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 31.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDoctorInformation(context),
                SizedBox(height: 30.v),
                _buildDateTime(context),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildSeventyOne(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 56.h,
      leading: AppbarLeadingImage(
        onTap: () {
          Navigator.pop(context);
        },
        imagePath: ImageConstant.imgIconChevronLeft,
        margin: EdgeInsets.only(
          left: 32.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "Details",
      ),
      actions: [
        AppbarTrailingImage(
          onTap: () async {
            final String url = 'tel:${doctorData['contact']}';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          imagePath: ImageConstant.imgUPhoneAlt,
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 8.v,
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(55), // Adjust the radius as needed
              child: CustomImageView(
                fit: BoxFit.cover,
                imagePath: doctorData['profilepic'],
                height: 111.adaptSize,
                width: 111.adaptSize,
              ),
            ),
            SizedBox(width: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorData['doctorsname'],
                  style: CustomTextStyles.titleMedium18,
                ),
                SizedBox(height: 8.v),
                Text(
                  doctorData['specialist'],
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 8.v),
                Row(
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
                        style: CustomTextStyles.labelLargeAmber500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 11.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgLinkedin,
                      height: 13.adaptSize,
                      width: 13.adaptSize,
                      margin: EdgeInsets.only(bottom: 2.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.h),
                      child: Text(
                        "800m away", // doctorData['location'] + " away",
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 17.v),
        Text(
          "About",
          style: theme.textTheme.titleMedium,
        ),
        SizedBox(height: 8.v),
        SizedBox(
          width: 305.h,
          child: ReadMoreText(
            doctorData['description'],
            trimLines: 3,
            colorClickableText: theme.colorScheme.primary,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Read more",
            moreStyle: CustomTextStyles.bodySmallGray600.copyWith(
              height: 1.50,
            ),
            lessStyle: CustomTextStyles.bodySmallGray600.copyWith(
              height: 1.50,
            ),
          ),
        ),
        SizedBox(height: 17.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Degree",
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800
                  ),
                ),
                SizedBox(height: 8.v),
                Text(
                  doctorData['degrees'].join(', '),
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fees",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800
                  ),
                ),
                SizedBox(height: 8.v),
                Text(
                  doctorData['fees'],
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Available On",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800
                  ),
                ),
                SizedBox(height: 8.v),
                Text(
                  doctorData['availableOn'].join(', '),
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 17.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Experience",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800
                  ),
                ),
                SizedBox(height: 8.v),
                Text(
                  doctorData['experience'],
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
            // Add additional columns here if needed
          ],
        ),
      ],
    );
  }



  Widget _buildDateTime(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80.v,
          width: 327.h,
          child: EasyDateTimeLine(
            initialDate: selectedDatesFromCalendar1,
            locale: 'en_US',
            headerProps: EasyHeaderProps(
              selectedDateFormat: SelectedDateFormat.fullDateDMY,
              monthPickerType: MonthPickerType.switcher,
              showHeader: false,
            ),
            dayProps: EasyDayProps(
              width: 46.h,
              height: 80.v,
            ),
            onDateChange: (selectedDate) {},
            itemBuilder: (context, dayNumber, dayName, monthName, fullDate, isSelected) {
              return isSelected
                  ? Container(
                width: 55.h,
                height: 100.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 11.h,
                  vertical: 8.v,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(15.h),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 6.v),
                      child: Text(
                        dayName.toString(),
                        style: CustomTextStyles.labelMediumWhiteA700.copyWith(
                          color: appTheme.whiteA700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.v),
                      child: Text(
                        dayNumber.toString(),
                        style: CustomTextStyles.titleMediumWhiteA70018.copyWith(
                          color: appTheme.whiteA700,
                        ),
                      ),
                    )
                  ],
                ),
              )
                  : Container(
                width: 55.h,
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(15.h),
                  border: Border.all(
                    color: appTheme.gray300,
                    width: 1.h,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 3.h,
                        top: 4.v,
                      ),
                      child: Text(
                        dayName.toString(),
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: appTheme.gray500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.v),
                      child: Text(
                        dayNumber.toString(),
                        style: CustomTextStyles.titleMedium18.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 32.v),
        Divider(),
        SizedBox(height: 32.v),
        Wrap(
          runSpacing: 9.v,
          spacing: 9.h,
          children: List<Widget>.generate(9, (index) {
            int hour = (index ~/ 2) + 9; // Start from 9:00 AM
            int minute = (index % 2) * 30; // Alternate between 0 and 30 minutes
            TimeOfDay time = TimeOfDay(hour: hour, minute: minute);
            return AmItemWidget(time: time);
          }),
        ),

      ],
    );
  }

  Widget _buildSeventyOne(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatWithDoctorScreen(
          doctor: null,
        )));
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.h,
          right: 24.h,
          bottom: 28.v,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              height: 50.adaptSize,
              width: 50.adaptSize,
              padding: EdgeInsets.all(13.h),
              decoration: IconButtonStyleHelper.fillOnErrorContainer,
              child: CustomImageView(
                imagePath: ImageConstant.imgSettings,

              ),
            ),
            Expanded(
              child: CustomElevatedButton(
                height: 50.v,
                text: "Book Appointment",
                margin: EdgeInsets.only(left: 16.h),
                buttonTextStyle: CustomTextStyles.titleSmallWhiteA700SemiBold,
                onPressed: () {
                  _showAppointmentBookedDialog(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showAppointmentBookedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Appointment Booked'),
          content: Text('Your appointment has been successfully booked.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }



}

