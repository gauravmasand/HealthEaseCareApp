import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

/// show all the prescription page
class PrescriptionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample prescription data for demonstration
    List<Prescription> prescriptions = [
      Prescription(
        medication: "Paracetamol",
        dosage: "500 mg",
        instructions: "Take 1 tablet every 6 hours",
        duration: "7 days",
        frequency: "Every 6 hours",
        additionalInfo: "Take with food",
      ),
      Prescription(
        medication: "Amoxicillin",
        dosage: "250 mg",
        instructions: "Take 1 capsule every 8 hours",
        duration: "10 days",
        frequency: "Every 8 hours",
        additionalInfo: "Complete the full course",
      ),
      Prescription(
        medication: "Loratadine",
        dosage: "10 mg",
        instructions: "Take 1 tablet daily",
        duration: "14 days",
        frequency: "Once daily",
        additionalInfo: "Avoid alcohol",
      ),
      Prescription(
        medication: "Ibuprofen",
        dosage: "400 mg",
        instructions: "Take 2 tablets as needed for pain",
        duration: "As needed",
        frequency: "As needed",
        additionalInfo: "Do not exceed 6 tablets in 24 hours",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription List'),
      ),
      body: ListView.builder(
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          return PrescriptionListItem(prescription: prescriptions[index]);
        },
      ),
    );
  }
}

class PrescriptionListItem extends StatefulWidget {
  final Prescription prescription;

  PrescriptionListItem({required this.prescription});

  @override
  _PrescriptionListItemState createState() => _PrescriptionListItemState();
}

class _PrescriptionListItemState extends State<PrescriptionListItem> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _showMore = !_showMore;
        });
      },
      children: [
        ExpansionPanel(
          isExpanded: _showMore,
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(widget.prescription.medication),
              subtitle: Text('Tap to show more'),
            );
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dosage: ${widget.prescription.dosage}'),
              Text('Instructions: ${widget.prescription.instructions}'),
              Text('Duration: ${widget.prescription.duration}'),
              Text('Frequency: ${widget.prescription.frequency}'),
              Text('Additional Info: ${widget.prescription.additionalInfo}'),
            ],
          ),
        ),
      ],
    );
  }
}

class Prescription {
  final String medication;
  final String dosage;
  final String instructions;
  final String duration;
  final String frequency;
  final String additionalInfo;

  Prescription({
    required this.medication,
    required this.dosage,
    required this.instructions,
    required this.duration,
    required this.frequency,
    required this.additionalInfo,
  });
}
