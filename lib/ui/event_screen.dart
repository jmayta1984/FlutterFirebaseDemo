import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/models/event_detail.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event"),
      ),
      body: EventList(),
    );
  }
}

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final Firestore db = Firestore.instance;
  List<EventDetail> details = [];

  @override
  void initState() {
    if (mounted) {
      getDetailList().then((data) {
        setState(() {
          details = data;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (details != null) ? details.length : 0,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(details[index].description),
          subtitle: Text(details[index].date),
        );
      },
    );
  }

  Future<List<EventDetail>> getDetailList() async {
    var data = await db.collection('event_details').getDocuments();

    if (data != null) {
      details = data.documents
          .map((document) => EventDetail.fromMap(document))
          .toList();
    }
    return details;
  }
}
