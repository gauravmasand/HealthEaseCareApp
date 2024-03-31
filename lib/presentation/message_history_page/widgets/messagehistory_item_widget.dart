import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';

import '../../chat_with_doctor_screen/chat_with_doctor_screen.dart';

// ignore: must_be_immutable
// Modify MessagehistoryItemWidget to accept the JSON object
class MessagehistoryItemWidget extends StatelessWidget {
  final Map<String, dynamic> doctorJson;

  const MessagehistoryItemWidget({Key? key, required this.doctorJson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = Doctor.fromJson(doctorJson);
    return InkWell(
      onTap: () {
        // Navigate to the chat screen with the doctor information
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatWithDoctorScreen(doctor: doctor),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 25.adaptSize,
            backgroundImage: NetworkImage(doctor.profilepic),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              top: 7.v,
              bottom: 4.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.doctorsname,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 4.v),
                Container(
                  width: 200,
                  child: Text(
                    doctor.description,
                    style: CustomTextStyles.bodySmallBluegray400,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 28.h,
              top: 11.v,
              bottom: 7.v,
            ),
            child: Column(
              children: [
                Text(
                  "10.24", // Example time, replace with actual time
                  style: CustomTextStyles.bodySmallBluegray700,
                ),
                SizedBox(height: 3.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 13.adaptSize,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.h,
                      vertical: 1.v,
                    ),
                    decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Text(
                      "1",
                      style: CustomTextStyles.labelSmallInterWhiteA700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class Doctor {
  final String doctorsname;
  final String profilepic;
  final String experience;
  final List<String> availableOn;
  final List<String> workdays;
  final String fees;
  final String emergencyfees;
  final String location;
  final List<String> degrees;
  final String specialist;
  final String rating;
  final String contact;
  final String description;

  Doctor({
    required this.doctorsname,
    required this.profilepic,
    required this.experience,
    required this.availableOn,
    required this.workdays,
    required this.fees,
    required this.emergencyfees,
    required this.location,
    required this.degrees,
    required this.specialist,
    required this.rating,
    required this.contact,
    required this.description,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorsname: json['doctorsname'],
      profilepic: json['profilepic'],
      experience: json['experience'],
      availableOn: List<String>.from(json['availableOn']),
      workdays: List<String>.from(json['workdays']),
      fees: json['fees'],
      emergencyfees: json['emergencyfees'],
      location: json['location'],
      degrees: List<String>.from(json['degrees']),
      specialist: json['specialist'],
      rating: json['rating'],
      contact: json['contact'],
      description: json['description'],
    );
  }
}
