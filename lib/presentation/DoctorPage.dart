import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/data/doctors.dart';
import 'home_page/widgets/home_item_widget.dart';


/// show all the Doctor
class DoctorPage extends StatefulWidget {
  DoctorPage();

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 220,
            crossAxisCount: 2,
            mainAxisSpacing: 17,
            crossAxisSpacing: 17,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: doctors['doctors']!.length,
          itemBuilder: (context, index) {
            return HomeItemWidget(doctors['doctors']![index]);
          },
        ).px(25),
      ),
    );
  }
}
