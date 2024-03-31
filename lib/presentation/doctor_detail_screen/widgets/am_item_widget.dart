import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';

class AmItemWidget extends StatelessWidget {
  final TimeOfDay time;

  const AmItemWidget({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedTime = '${time.hour}:${time.minute == 0 ? '00' : '30'}';
    String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 11.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        '$formattedTime $period',
        style: TextStyle(
          color: appTheme.gray500,
          fontSize: 12.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.whiteA700,
      selectedColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.gray300,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(
          15.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
