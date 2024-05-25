// ignore_for_file: unused_label

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'viewsingleevent.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget EventBox = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search events',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              // Implement search functionality here
              // You can filter events based on the value entered in the search bar
              onChanged:
              (value) {
                String searchQuery = value.trim();
                if (searchQuery.isNotEmpty) {
                  FirebaseFirestore.instance
                      .collection('posts')
                      .where('isfinished', isEqualTo: false)
                      .where('title', isGreaterThanOrEqualTo: searchQuery)
                      .where('title',
                          isLessThanOrEqualTo: searchQuery + '\uf8ff')
                      .snapshots()
                      .listen((QuerySnapshot snapshot) {
                    // Handle search results here
                    setState(() {
                      print('A7A');
                      // Update UI with search results
                    });
                  });
                } else {
                  // If search query is empty, show all events
                  FirebaseFirestore.instance
                      .collection('posts')
                      .where('isfinished', isEqualTo: false)
                      .snapshots()
                      .listen((QuerySnapshot snapshot) {
                    // Handle all events here
                    setState(() {
                      print('sii');
                      // Update UI to show all events
                    });
                  });
                }
              };
            },
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .where('isfinished', isEqualTo: false)
                .snapshots(),
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
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return Column(children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Card(
                      color: const Color.fromARGB(255, 102, 19, 19),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 350,
                        height: 430,
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
                                cacheWidth: 200,
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
                            Text('${data['time']}',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
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
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Sponsored By : ${data['sponsorname']}',
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
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SingleEventPage(
                                    postId: data['postId'],
                                  ),
                                ),
                              ),
                              child: const Text('View'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]);
                }).toList(),
              );
            },
          ),
        ],
      ),
    );

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




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'viewsingleevent.dart';

// class EventPage extends StatefulWidget {
//   const EventPage({super.key});

//   @override
//   State<EventPage> createState() => _EventPageState();
// }

// class _EventPageState extends State<EventPage> {
//   @override
//   Widget build(BuildContext context) {
//     Widget EventBox = SingleChildScrollView(
//         child: StreamBuilder<QuerySnapshot>(
//       // FirebaseFirestore.instance.collection('posts').where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),for own events
//       stream: FirebaseFirestore.instance
//           .collection('posts')
//           .where('isfinished', isEqualTo: false)
//           .snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         return ListView(
//           padding: const EdgeInsets.only(bottom: 100),
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//             return Column(children: [
//               const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//               Card(
//                 color: const Color.fromARGB(255, 102, 19, 19),
//                 shape: const RoundedRectangleBorder(
//                   side: BorderSide(
//                     color: Color.fromARGB(255, 0, 0, 0),
//                   ),
//                 ),
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   width: 350,
//                   height: 430,
//                   child: Column(
//                     children: [
//                       Card(
//                         shape: const RoundedRectangleBorder(
//                           side: BorderSide(
//                             color: Color.fromARGB(255, 0, 0, 0),
//                           ),
//                         ),
//                         child: Image.network(
//                           data['postUrl'],
//                           cacheHeight: 150,
//                           cacheWidth: 200,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(data['title'],
//                           style: GoogleFonts.lato(
//                             color: Colors.white,
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(data['location'],
//                           style: GoogleFonts.lato(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text('${data['time']}',
//                           style: GoogleFonts.lato(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text('Max Attendees : ${data['maxattendees']}',
//                           style: GoogleFonts.lato(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text('Sponsored By : ${data['sponsorname']}',
//                           style: GoogleFonts.lato(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           textAlign: TextAlign.center),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       OutlinedButton(
//                         onPressed: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SingleEventPage(
//                               postId: data['postId'],
//                             ),
//                           ),
//                         ),
//                         child: const Text('View'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // Add more widgets to display other data as needed
//             ]);
//           }).toList(),
//         );
//       },
//     ));

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Events : ',
//           style: GoogleFonts.lato(
//             color: const Color.fromARGB(255, 226, 205, 255),
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 80, 0, 0),
//       ),
//       body: Container(
//         alignment: Alignment.topCenter,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 155, 155, 155),
//               Color.fromARGB(255, 202, 202, 202)
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: EventBox,
//       ),
//     );
//   }
// }
