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

final studentProfileRef = FirebaseFirestore.instance
    .collection('StudentProfile')
    .withConverter<StudentProfile>(
      fromFirestore: (snapshots, _) =>
          StudentProfile.fromJson(snapshots.data()!),
      toFirestore: (studenProfile, _) => studenProfile.toJson(),
    );

enum StudentProfileQuery {
  likesAsc,
  likesDesc,
}

extension on Query<StudentProfile> {
  /// Create a firebase query from a [StudentProfileQuery]
  Query<StudentProfile> queryBy(StudentProfileQuery query) {
    switch (query) {
      case StudentProfileQuery.likesAsc:
        return orderBy('year', descending: true);

      case StudentProfileQuery.likesDesc:
        return orderBy('year', descending: false);
    }
  }
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
        body: const FillFormWidget(),
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

class FillFormWidget extends StatefulWidget {
  const FillFormWidget({super.key});

  @override
  State<FillFormWidget> createState() => _FillFormWidgetState();
}

class _FillFormWidgetState extends State<FillFormWidget> {
  // ignore: empty_constructor_bodies
  StudentProfileQuery query = StudentProfileQuery.likesDesc;

  String? name, studentID, studentProgram;
  double? gpa;

  late final StudentProfile studentProfile;
  late final DocumentReference<StudentProfile> reference;

  createData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('StudentProfile').doc(studentID);

    Map<String, dynamic> students = {
      'name': name,
      'studentID': studentID,
      'studentProgram': studentProgram,
      'gpa': gpa,
    };
    documentReference.set(students).whenComplete(() => print('$studentID'));
  }

  getName(name) {
    this.name = name;
  }

  getStudentID(studentID) {
    this.studentID = studentID;
  }

  getStudentProgram(studentProgram) {
    this.studentProgram = studentProgram;
  }

  getGPA(gpa) {
    this.gpa = double.tryParse(gpa);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      helperText: '',
                      icon: Icon(Icons.person),
                    ),
                    onChanged: (String name) {
                      getName(name);
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'StudentID',
                        helperText: '',
                        icon: Icon(Icons.credit_score)),
                    onChanged: (String studentID) {
                      getStudentID(studentID);
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Student Program',
                        helperText: '',
                        icon: Icon(Icons.add_business)),
                    onChanged: (String studentProgram) {
                      getStudentProgram(studentProgram);
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'GPA',
                        helperText: '',
                        icon: Icon(Icons.account_box)),
                    onChanged: (String gpa) {
                      getGPA(gpa);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          createData();
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
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: StreamBuilder<QuerySnapshot<StudentProfile>>(
                      stream: studentProfileRef.queryBy(query).snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Something went wrong");
                        }

                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final data = snapshot.requireData;
                          print('data: ${data.size}');
                          //return Text('data');
                          return ListView.builder(
                            itemCount: data.size,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(studentProfile.name),
                                subtitle: Text(studentProfile.studentId),
                                trailing: Text(studentProfile.studentProgram),
                              );
                            },
                          );
                        }
                      },
                      /*stream: FirebaseFirestore.instance
                          .collection('StudentProfile')
                          .snapshots(),*/
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StudentProfile extends Equatable {
  const StudentProfile({
    required this.studentId,
    required this.name,
    required this.studentProgram,
    required this.gpa,
  });

  final String name;
  final String studentId;
  final String studentProgram;
  final double gpa;

  //static const empty = StudentProfile(studentId: '');

  //bool get isNotEmpty => this != StudentProfile.empty;
  //bool get isEmpty => this == StudentProfile.empty;

  StudentProfile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        studentId = json['studentId'],
        studentProgram = json['studentProgram'],
        gpa = json['gpa'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'studentId': studentId,
        'studentProgram': studentProgram,
        'gpa': gpa,
      };

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [name, studentId, studentProgram, gpa];
}
/*
class StudentProfileDataProvider {
  Future<RawData> readData() async {}
}
*/
*/

