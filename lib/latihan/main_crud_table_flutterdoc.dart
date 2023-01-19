/*
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const LessonnCRUDFirebaseWidget());
}

enum StudentProfileQuery {
  likesAsc,
  likesDesc,
}

class LessonnCRUDFirebaseWidget extends StatelessWidget {
  const LessonnCRUDFirebaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CRUD Firebase'),
        ),
        body: AddUser(),
      ),
      theme: ThemeData(
        //primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
        ),
      ),
    );
  }
}

class AddUser extends StatelessWidget {
  final String? name;
  final String? studentID;
  final String? studentProgram;
  final double? gpa;

  AddUser({
    this.studentID,
    this.name,
    this.studentProgram,
    this.gpa,
  });

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users =
        FirebaseFirestore.instance.collection('StudentProfile');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'name': name,
            'studentId': studentID,
            'studentProgram': studentProgram,
            'gpa': gpa, // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      helperText: '',
                      icon: Icon(Icons.person),
                    ),
                  ),
                  const TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'StudentID',
                        helperText: '',
                        icon: Icon(Icons.credit_score)),
                  ),
                  const TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Student Program',
                        helperText: '',
                        icon: Icon(Icons.add_business)),
                  ),
                  const TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'GPA',
                        helperText: '',
                        icon: Icon(Icons.account_box)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          addUser;
                        },
                        child: const Text('CREATE'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('READ');
                        },
                        child: const Text('READ'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('UPDATE');
                        },
                        child: const Text('UPDATE'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('DELETE');
                        },
                        child: const Text('DELETE'),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: addUser,
                    child: const Text(
                      "Add User",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/