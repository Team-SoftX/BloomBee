import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:register/Admin_Portal/adminhome.dart';
import 'package:register/Admin_Portal/taskForm.dart';
import 'package:register/Admin_Portal/utils/pallete.dart';
import 'package:register/Admin_Portal/view_contact_page.dart';
// import 'package:restful5/screens/insert_contact_page.dart';
// import 'package:restful5/screens/view_contact_page.dart';
// import 'package:restful5/utils/pallete.dart';

class ManageActivity extends StatefulWidget {
  const ManageActivity({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ManageActivity createState() => _ManageActivity();
}

class _ManageActivity extends State<ManageActivity> {
  final CollectionReference contacts =
      FirebaseFirestore.instance.collection('tasks');

  // Deleteing a product by id
  Future<void> _deleteContact(String contactId) async {
    await contacts.doc(contactId).delete();

    // Show a snackbar
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a contact')));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Manage Tasks'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              child: const Icon(Icons.arrow_back // add custom icons also
                  ),
            ),
          ),
          body: Center(
            child: StreamBuilder(
              stream: contacts.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];

                      return buildCard(context, documentSnapshot);
                    },
                  );
                } else if (streamSnapshot.hasError) {
                  return Text('${streamSnapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InsertContactPage()),
              );
            },
            tooltip: 'Add Contact',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, DocumentSnapshot documentSnapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: const BoxDecoration(color: Pallete.cardColor),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 42.0,
                width: 42.0,
                decoration: const BoxDecoration(
                  color: Pallete.iconBg,
                  borderRadius: BorderRadius.all(Radius.circular(42.0)),
                ),
                child: const Icon(
                  Icons.task,
                  color: Pallete.mainBlue,
                ),
              ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task Name: ${documentSnapshot['Tname']}', //modify this
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'Task Description: ${documentSnapshot['Task Description']}', //modify this
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Start date : ${documentSnapshot['Sdate']}', //modify this
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'End date : ${documentSnapshot['Edate']}', //modify this
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'Note: ${documentSnapshot['Notes']}', //modify this
                    style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                  child: Text(' View/Edit '),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewContactPage(
                              documentSnapshot: documentSnapshot)),
                    );
                  }),
              const SizedBox(width: 8),
              TextButton(
                child: const Text(' Delete '),
                onPressed: () {
                  _deleteContact(documentSnapshot.id);
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
