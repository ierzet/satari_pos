import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LessonnCRUDFirebaseWidget());
}

class LessonnCRUDFirebaseWidget extends StatelessWidget {
  const LessonnCRUDFirebaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => StudentProfileRepository(),
        child: HomePage(),
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

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentProfileBloc(
          studentProfileRepository:
              RepositoryProvider.of<StudentProfileRepository>(context)),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('CRUD Firebase'),
        ),
        body: BlocBuilder<StudentProfileBloc, StudentProfileState>(
          builder: (context, state) {
            if (state is StudentAdding) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is StudentDeleting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is StudentError) {
              return const Center(child: Text('Error'));
            }

            return FillFormWidget();
          },
        ),
      ),
    );
  }
}

class FillFormWidget extends StatefulWidget {
  FillFormWidget({super.key});

  @override
  State<FillFormWidget> createState() => _FillFormWidgetState();
}

class _FillFormWidgetState extends State<FillFormWidget> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController studentIDController = TextEditingController();

  final TextEditingController studentProgramController =
      TextEditingController();

  final TextEditingController gpaController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StudentProfileBloc>(context).add(GetData());
  }

  void postData(context) {
    BlocProvider.of<StudentProfileBloc>(context).add(
      Create(nameController.text, studentIDController.text,
          studentProgramController.text, double.parse(gpaController.text)),
    );
  }

  void deleteData(context) {
    BlocProvider.of<StudentProfileBloc>(context)
        .add(DeleteData(idController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        helperText: '',
                        icon: Icon(Icons.person),
                      ),
                    ),
                    TextField(
                      controller: studentIDController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'StudentID',
                          helperText: '',
                          icon: Icon(Icons.credit_score)),
                    ),
                    TextField(
                      controller: studentProgramController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Student Program',
                          helperText: '',
                          icon: Icon(Icons.add_business)),
                    ),
                    TextField(
                      controller: gpaController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'GPA',
                          helperText: '',
                          icon: Icon(Icons.account_box)),
                    ),
                    TextField(
                      enabled: false,
                      controller: idController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ID',
                          helperText: '',
                          icon: Icon(Icons.account_box)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            postData(context);
                            nameController.text = '';
                            studentIDController.text = '';
                            studentProgramController.text = '';
                            gpaController.text = '';
                            idController.text = '';
                          },
                          child: const Text('CREATE'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            nameController.text = '';
                            studentIDController.text = '';
                            studentProgramController.text = '';
                            gpaController.text = '';
                            idController.text = '';
                          },
                          child: const Text('CLEAR'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            deleteData(context);
                            postData(context);
                          },
                          child: const Text('UPDATE'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            deleteData(context);
                            nameController.text = '';
                            studentIDController.text = '';
                            studentProgramController.text = '';
                            gpaController.text = '';
                            idController.text = '';
                          },
                          child: const Text('DELETE'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<StudentProfileBloc, StudentProfileState>(
                      builder: (context, state) {
                        if (state is StudentLoaded) {
                          List<StudentProfile> studentData = state.studentData;
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: studentData.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        nameController.text =
                                            studentData[index].name;
                                        studentIDController.text =
                                            studentData[index].studentID;
                                        studentProgramController.text =
                                            studentData[index].studentProgram;
                                        gpaController.text =
                                            studentData[index].gpa.toString();
                                        idController.text =
                                            studentData[index].id.toString();
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(studentData[index]
                                                  .studentID)),
                                          Expanded(
                                              child: Text(studentData[index]
                                                  .studentProgram)),
                                          Expanded(
                                              child: Text(
                                                  studentData[index].name)),
                                          Expanded(
                                              child: Text(studentData[index]
                                                  .gpa
                                                  .toString())),
                                          Expanded(
                                              child: Text(studentData[index]
                                                  .id
                                                  .toString())),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else if (state is StudentLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StudentProfile extends Equatable {
  final String studentID;
  final double gpa;
  final String name;
  final String studentProgram;
  final String? id;
  final String? dateOfBirth;

  const StudentProfile(
      {required this.studentID,
      required this.gpa,
      required this.name,
      required this.studentProgram,
      this.id,
      this.dateOfBirth});

  static const empty =
      StudentProfile(studentID: '', gpa: 0, studentProgram: '', name: '');

  bool get isNotEmpty => this != StudentProfile.empty;
  bool get isEmpty => this == StudentProfile.empty;

  factory StudentProfile.fromJson(Map<String, dynamic> json, String idx) {
    return StudentProfile(
      studentID: json['studentID'],
      gpa: json['gpa'],
      name: json['name'],
      studentProgram: json['studentProgram'],
      id: idx,
      dateOfBirth: json['dateOfBirth'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'studentID': studentID,
        'studentProgram': studentProgram,
        'gpa': gpa,
      };

  @override
  List<Object?> get props =>
      [name, studentID, studentProgram, gpa, dateOfBirth];
}

class StudentProfileRepository {
  // ignore: non_constant_identifier_names
  final StudentProfileRepoAdd =
      FirebaseFirestore.instance.collection('StudentProfile');

  Future<void> create({
    required String name,
    required String studentID,
    required String studentProgram,
    required double gpa,
  }) async {
    try {
      await StudentProfileRepoAdd.add({
        'name': name,
        'studentID': studentID,
        'studentProgram': studentProgram,
        'gpa': gpa,
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Failed with error ${e.code} :${e.message}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> delete({required String id}) async {
    try {
      final studentProfileRepoDelete =
          FirebaseFirestore.instance.collection('StudentProfile');

      await studentProfileRepoDelete
          .doc(id)
          .delete()
          .then((value) => print("User Deleted"))
          .catchError((error) => print("Failed to delete user: $error"));
      ;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Failed with error ${e.code} :${e.message}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<StudentProfile>> get() async {
    List<StudentProfile> studentProfileList = [];
    try {
      final studentProfileRepoGet =
          await FirebaseFirestore.instance.collection('StudentProfile').get();
      studentProfileRepoGet.docs.forEach((element) {
        return studentProfileList
            .add(StudentProfile.fromJson(element.data(), element.id));
      });
      return studentProfileList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Failed with error ${e.code} :${e.message}');
      }
      return studentProfileList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

abstract class StudentProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Create extends StudentProfileEvent {
  final String name;
  final String studentID;
  final String studentProgram;
  final double gpa;
  Create(
    this.name,
    this.studentID,
    this.studentProgram,
    this.gpa,
  );
}

class GetData extends StudentProfileEvent {
  GetData();
}

class DeleteData extends StudentProfileEvent {
  final String id;
  DeleteData(this.id);
}

abstract class StudentProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends StudentProfileState {
  @override
  List<Object> get props => [];
}

class StudentAdding extends StudentProfileState {
  @override
  List<Object> get props => [];
}

class StudentAdded extends StudentProfileState {
  @override
  List<Object> get props => [];
}

class StudentLoading extends StudentProfileState {
  @override
  List<Object> get props => [];
}

class StudentDeleting extends StudentProfileState {
  @override
  List<Object> get props => [];
}

class StudentDeleted extends StudentProfileState {
  @override
  List<Object> get props => [];
}

class StudentLoaded extends StudentProfileState {
  final List<StudentProfile> studentData;
  StudentLoaded(this.studentData);
  @override
  List<Object> get props => [studentData];
}

class StudentError extends StudentProfileState {
  final String error;

  StudentError(this.error);
  @override
  List<Object> get props => [error];
}

class StudentProfileBloc
    extends Bloc<StudentProfileEvent, StudentProfileState> {
  final StudentProfileRepository studentProfileRepository;
  StudentProfileBloc({required this.studentProfileRepository})
      : super(InitialState()) {
    on<GetData>((event, emit) async {
      emit(StudentLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final studentData = await studentProfileRepository.get();

        emit(StudentLoaded(studentData));
      } catch (e) {
        emit(StudentError(e.toString()));
      }
    });
    on<Create>((event, emit) async {
      emit(StudentAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await studentProfileRepository.create(
            name: event.name,
            studentID: event.studentID,
            studentProgram: event.studentProgram,
            gpa: event.gpa);

        emit(StudentAdded());
      } catch (e) {
        emit(StudentError(e.toString()));
      }
    });
    on<DeleteData>((event, emit) async {
      emit(StudentDeleting());
      print('delete gak');
      await Future.delayed(const Duration(seconds: 1));
      try {
        await studentProfileRepository.delete(id: event.id);
        emit(StudentDeleted());
      } catch (e) {
        emit(StudentError(e.toString()));
      }
    });
  }
}

class StudentProfileDataTable extends StatelessWidget {
  const StudentProfileDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentProfileBloc, StudentProfileState>(
      builder: (context, state) {
        if (state is StudentLoaded) {
          List<StudentProfile> studentData = state.studentData;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: studentData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Expanded(child: Text(studentData[index].studentID)),
                          Expanded(
                              child: Text(studentData[index].studentProgram)),
                          Expanded(child: Text(studentData[index].name)),
                          Expanded(
                              child: Text(studentData[index].gpa.toString())),
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else if (state is StudentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }
}
