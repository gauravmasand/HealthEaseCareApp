import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:health_care_app/presentation/profile_page/widgets/profilelistsection_item_widget.dart';
import 'package:health_care_app/widgets/custom_icon_button.dart';
import 'package:readmore/readmore.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';

import 'doctor_detail_screen/widgets/am_item_widget.dart'; // ignore_for_file: must_be_immutable


/// show all the Doctor profile page
class DoctorProfilePage extends StatelessWidget {
  DoctorProfilePage({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                theme.colorScheme.secondaryContainer,
                theme.colorScheme.onError
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.linear,
            child: Column(
              children: [
                SizedBox(height: 44.v),
                _buildProfileSection(context),
                SizedBox(height: 27.v),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 29.v,
                  ),
                  decoration: AppDecoration.white.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 5.v),
                      Text("Best Psychiatrists in Pune. Book Doctor's Appointment Online, View Fees, User feedbacks, Address & Phone Numbers of Psychiatrists in Pune | Practo.", style: TextStyle(color: Colors.black),),
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.only(top: 20, bottom: 20, left: 28, right: 28),
                              child: Column(
                                children: [
                                  Text('Experienced', style:TextStyle(fontSize: 12),),
                                  SizedBox(height: 6,),
                                  Text('8 yrs', style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.only(top: 20, bottom: 20, left: 28, right: 28),
                              child: Column(
                                children: [
                                  Text('Rating', style:TextStyle(fontSize: 12),),
                                  SizedBox(height: 6,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star, color: Colors.blue, size: 15,),
                                      SizedBox(width: 2,),
                                      Text('4.5', style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.only(top: 20, bottom: 20, left: 28, right: 28),
                              child: Column(
                                children: [
                                  Text('Patients', style:TextStyle(fontSize: 12),),
                                  SizedBox(height: 6,),
                                  Text('200+', style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.v),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.perm_contact_cal, size: 22, color: Colors.blue,),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Contact', style: TextStyle(fontSize: 12),),
                                          Text('+917831818333', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.calendar_today, size: 22, color: Colors.blue,),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Available On', style: TextStyle(fontSize: 12),),
                                          Text('Monday, Wednesday, Friday', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.calendar_month, size: 22, color: Colors.blue,),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Workdays', style: TextStyle(fontSize: 12),),
                                          Text('Thursday, Wednesday, Friday', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 22,)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 82.v,
          width: 81.h,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEllipse27,
                height: 80.adaptSize,
                width: 80.adaptSize,
                radius: BorderRadius.circular(
                  40.h,
                ),
                alignment: Alignment.center,
              ),
              CustomIconButton(
                height: 24.adaptSize,
                width: 24.adaptSize,
                padding: EdgeInsets.all(4.h),
                decoration: IconButtonStyleHelper.fillWhiteA,
                alignment: Alignment.bottomRight,
                child: CustomImageView(
                  imagePath: ImageConstant.imgCamera,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 19.v),
        Text(
          "Amelia Renata",
          style: CustomTextStyles.titleMediumWhiteA70018,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Psychiatrist', style: TextStyle(color: Colors.white),),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.white
                ),
                height: 4, width: 4,),
            ),
            Text(
              "800m away",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildProfileListSection(BuildContext context) {
    return SizedBox(
      height: 75.v,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 44.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 31.5.h),
            child: SizedBox(
              height: 44.v,
              child: VerticalDivider(
                width: 1.h,
                thickness: 1.v,
                color: appTheme.blue300,
              ),
            ),
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return ProfilelistsectionItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildMySaveSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 48.v,
                  width: 43.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onErrorContainer,
                    borderRadius: BorderRadius.circular(
                      24.h,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgFavoritePrimary,
                width: 24.h,
                alignment: Alignment.center,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 18.h,
            top: 17.v,
            bottom: 11.v,
          ),
          child: Text(
            "My Saved",
            style: theme.textTheme.titleMedium,
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          width: 24.h,
          margin: EdgeInsets.only(
            top: 11.v,
            bottom: 10.v,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildAppointmentSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 48.v,
                  width: 43.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onErrorContainer,
                    borderRadius: BorderRadius.circular(
                      24.h,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgUserPrimary26x24,
                width: 24.h,
                alignment: Alignment.center,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 18.h,
            top: 17.v,
            bottom: 11.v,
          ),
          child: Text(
            "Appointmnet",
            style: theme.textTheme.titleMedium,
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          width: 24.h,
          margin: EdgeInsets.only(
            top: 11.v,
            bottom: 10.v,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildPaymentSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 48.v,
                  width: 43.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onErrorContainer,
                    borderRadius: BorderRadius.circular(
                      24.h,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgUser26x24,
                width: 24.h,
                alignment: Alignment.center,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 18.h,
            top: 17.v,
            bottom: 11.v,
          ),
          child: Text(
            "Payment Method",
            style: theme.textTheme.titleMedium,
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          width: 24.h,
          margin: EdgeInsets.only(
            top: 10.v,
            bottom: 11.v,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildFaqsSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 48.v,
          width: 43.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 48.v,
                  width: 43.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onErrorContainer,
                    borderRadius: BorderRadius.circular(
                      24.h,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgUser1,
                width: 24.h,
                alignment: Alignment.center,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 18.h,
            top: 16.v,
            bottom: 12.v,
          ),
          child: Text(
            "FAQs",
            style: theme.textTheme.titleMedium,
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          width: 24.h,
          margin: EdgeInsets.only(
            top: 11.v,
            bottom: 10.v,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildLogoutSection(BuildContext context) {
    return SizedBox(
      height: 48.v,
      width: 335.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 48.v,
              width: 43.h,
              decoration: BoxDecoration(
                color: appTheme.red50,
                borderRadius: BorderRadius.circular(
                  24.h,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 9.h,
                top: 10.v,
                bottom: 10.v,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIcRoundLogout,
                    width: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 28.h,
                      top: 6.v,
                    ),
                    child: Text(
                      "Logout",
                      style: CustomTextStyles.titleMediumRedA200,
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    width: 24.h,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDoctorInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 41.h),
          child: Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle959,
                height: 111.adaptSize,
                width: 111.adaptSize,
                radius: BorderRadius.circular(
                  8.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 7.v,
                  bottom: 5.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Marcus Horizon",
                      style: CustomTextStyles.titleMedium18,
                    ),
                    SizedBox(height: 8.v),
                    Text(
                      "Chardiologist",
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
                            "4.7",
                            style: CustomTextStyles.labelLargeAmber500,
                          ),
                        )
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
                            "800m away",
                            style: theme.textTheme.labelLarge,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
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
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam... ",
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
        )
      ],
    );
  }

  DateTime selectedDatesFromCalendar1 = DateTime.now();

  /// Section Widget
  Widget _buildDateTime(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 64.v,
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
              height: 64.v,
            ),
            onDateChange: (selectedDate) {},
            itemBuilder:
                (context, dayNumber, dayName, monthName, fullDate, isSelected) {
              return isSelected
                  ? Container(
                  width: 46.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.h,
                    vertical: 8.v,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(
                      15.h,
                    ),
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
                          style: CustomTextStyles.labelMediumWhiteA700
                              .copyWith(
                            color: appTheme.whiteA700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.v),
                        child: Text(
                          dayNumber.toString(),
                          style: CustomTextStyles.titleMediumWhiteA70018
                              .copyWith(
                            color: appTheme.whiteA700,
                          ),
                        ),
                      )
                    ],
                  ))
                  : Container(
                width: 46.h,
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(
                    15.h,
                  ),
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

  /// Section Widget
  Widget _buildSeventyOne(BuildContext context) {
    return Padding(
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
              text: "Book Apointment",
              margin: EdgeInsets.only(left: 16.h),
              buttonTextStyle: CustomTextStyles.titleSmallWhiteA700SemiBold,
              onPressed: () {
                onTapBookApointment(context);
              },
            ),
          )
        ],
      ),
    );
  }

  /// Navigates to the bookingDoctorScreen when the action is triggered.
  onTapBookApointment(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.bookingDoctorScreen);
  }
}