import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyEventPage extends StatefulWidget {
  const MyEventPage({super.key});

  @override
  State<MyEventPage> createState() => _MyEventPage();
}

class _MyEventPage extends State<MyEventPage> {
  @override
  Widget build(BuildContext context) {
    Widget EventBox = SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
      // FirebaseFirestore.instance.collection('posts').where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),for own events
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          padding: const EdgeInsets.only(bottom: 100),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return Column(children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Card(
                color: Color.fromARGB(255, 102, 19, 19),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 350,
                  height: 350,
                  child: Column(
                    children: [
                      Card(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        child: Image.network(
                          data['postUrl'],
                          cacheHeight: 150,
                          cacheWidth: 150,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(data['title'],
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(data['location'],
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('View'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Max Attendees : ${data['maxattendees']}',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),

              // Add more widgets to display other data as needed
            ]);
          }).toList(),
        );
      },
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events : ',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 226, 205, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 0, 0),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 155, 155, 155),
              Color.fromARGB(255, 202, 202, 202)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: EventBox,
      ),
    );
  }
}
