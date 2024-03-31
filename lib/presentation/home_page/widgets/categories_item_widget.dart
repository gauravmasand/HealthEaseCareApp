import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';
import 'package:health_care_app/presentation/AmbulancePage.dart';
import 'package:health_care_app/presentation/DoctorPage.dart';
import 'package:health_care_app/presentation/HosptialPage.dart';
import 'package:health_care_app/presentation/pharmacy_screen/pharmacy_screen.dart';

// ignore: must_be_immutable
class CategoriesItemWidget extends StatelessWidget {
  CategoriesItemWidget({Key? key, required this.icon, required this.title})
      : super(
          key: key,
        );

  String icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () {
         if (title == "220m") {
           Navigator.push(context, MaterialPageRoute(builder: (context) => AmbulancePage()));
         } else if (title == "Hospital") {
           Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalListPage()));
         } else if (title == "Pharmacy") {
           Navigator.push(context, MaterialPageRoute(builder: (context) => PharmacyScreen()));
         } else if (title == "Doctors") {
           Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorPage()));
         }
       },
      child: SizedBox(
        width: 76.h,
        child: Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Column(
            children: [
              Container(
                height: 56.v,
                width: 64.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                  vertical: 12.v,
                ),
                decoration: AppDecoration.fillOnErrorContainer.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: CustomImageView(
                  imagePath: icon,
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 9.v),
              Text(
                title,
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
