import 'package:health_care_app/presentation/Prescription.dart';
import 'package:health_care_app/presentation/home_page/home_page.dart';
import 'package:health_care_app/presentation/message_history_tab_container_page/message_history_tab_container_page.dart';
import 'package:health_care_app/presentation/profile_page/profile_page.dart';
import 'package:health_care_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/app_export.dart';

import '../../core/utils/data.dart';
import '../DoctorProfilePage.dart';

// ignore_for_file: must_be_immutable
class HomeContainerScreen extends StatelessWidget {
  HomeContainerScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homePage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Message:
        return AppRoutes.messageHistoryTabContainerPage;
      case BottomBarEnum.Calendargray500:
        return "/";
      case BottomBarEnum.Lockgray500:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.messageHistoryTabContainerPage:
        return MessageHistoryTabContainerPage();
      case AppRoutes.profilePage:
        return Data.flag ? DoctorProfilePage() : ProfilePage();
        case AppRoutes.prescriptionListPage:
        return PrescriptionListPage();
      default:
        return PrescriptionListPage();
    }
  }
}
