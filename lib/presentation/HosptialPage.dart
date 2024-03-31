import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/data/Hospotal.dart';

/// show all the hospital page
class HospitalListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hospital List'),
      ),
      body: ListView.builder(
        itemCount: hospital['hospitals']?.length,
        itemBuilder: (context, index) {
          var hospitalData = hospital['hospitals']![index];
          return HospitalListItem(
            hospitalName: hospitalData['hospitalName'],
            imageUrl: hospitalData['imageUrl'],
            rating: hospitalData['rating'],
            speciality: hospitalData['speciality'],
            doctors: hospitalData['doctors'],
          );
        },
      ),
    );
  }
}


class HospitalListItem extends StatefulWidget {
  final hospitalName;
  final imageUrl;
  final rating;
  final speciality;
  final doctors;

  HospitalListItem({
    required this.hospitalName,
    required this.imageUrl,
    required this.rating,
    required this.speciality,
    required this.doctors,
  });

  @override
  _HospitalListItemState createState() => _HospitalListItemState();
}

class _HospitalListItemState extends State<HospitalListItem> {
  bool _showDoctors = false;

  void _makePhoneCall(String contactNumber) async {
    final url = 'tel:$contactNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              widget.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hospitalName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 5),
                    Text(
                      widget.rating.toString(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Speciality: ${widget.speciality}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _makePhoneCall("+918767932356"),
                  child: Text('Call', style: TextStyle(
                      color: Colors.white
                  ),),
                ),
                Row(
                  children: [
                    Text(
                      'Doctors:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(_showDoctors ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                      onPressed: () {
                        setState(() {
                          _showDoctors = !_showDoctors;
                        });
                      },
                    ),
                  ],
                ),
                if (_showDoctors)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.doctors.map<Widget>((doctor) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundImage: NetworkImage(doctor['profilepic']),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '${doctor['doctorsname']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              '${doctor['specialist']} - ${doctor['experience']} of experience',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '${doctor['description']}',
                              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}