import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/data/Ambulance.dart';

/// show all the ambulance
class AmbulancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambulance Services'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: ambulances['ambulances']!.length,
        itemBuilder: (context, index) {
          final ambulance = ambulances['ambulances']![index];
          return AmbulanceCard(
            ambulanceName: ambulance['ambulanceName']!,
            ambulancePic: ambulance['ambulancePic']!,
            contactNo: ambulance['contactNo']!,
            location: ambulance['location']!,
          );
        },
      ),
    );
  }
}
class AmbulanceCard extends StatelessWidget {
  final String ambulanceName;
  final String ambulancePic;
  final String contactNo;
  final String location;

  AmbulanceCard({
    required this.ambulanceName,
    required this.ambulancePic,
    required this.contactNo,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String phoneNumber = 'tel:$contactNo';
        if (await canLaunch(phoneNumber)) {
          await launch(phoneNumber);
        } else {
          throw 'Could not launch $phoneNumber';
        }
      },
      child: Container(
        height: 350, // Set a fixed height for the container
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          ambulancePic, // Use the ambulancePic URL here
                          fit: BoxFit.cover,
                          width: 30, // Set the width of the image
                          height: 30, // Set the height of the image
                        ),
                      ),
                      SizedBox(width: 10), // Add some space between the image and text
                      Container(
                        width: 100,
                        height: 45,
                        child: Text(
                          ambulanceName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Location: $location',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Contact No: $contactNo',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
