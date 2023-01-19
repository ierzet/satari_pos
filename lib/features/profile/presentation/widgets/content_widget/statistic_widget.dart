import 'package:flutter/material.dart';
import 'package:satari_pos/core/util/constant.dart';
import 'package:satari_pos/features/profile/domain/entities/personal_information.dart';

// ignore: must_be_immutable
class StatisticWidget extends StatefulWidget {
  const StatisticWidget({super.key});

  @override
  State<StatisticWidget> createState() => _StatisticWidgetState();
}

class _StatisticWidgetState extends State<StatisticWidget> {
  PersonalInformation personalInformation = const PersonalInformation(
    firstName: 'erzet',
    lastName: 'satari',
    email: 'sadf',
    address: 'dsf',
    dateOfBirth: 'sdf',
    phoneNumber: 'asdf',
    postalCode: 'sdf',
  );

  List<PersonalInformation> dataPersonalInformation = [];

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Column(children: [
      Expanded(
          child: Card(
              color: Colors.green,
              elevation: 8,
              child: Padding(
                  padding: EdgeInsets.all(defaultPaddingDouble),
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        const Text(
                          'PersonalInformation',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('firstName')),
                            DataColumn(label: Text('lastName')),
                            DataColumn(label: Text('email')),
                            DataColumn(label: Text('dateOfBirth')),
                            DataColumn(label: Text('address')),
                            DataColumn(label: Text('PhoneNumber')),
                            DataColumn(label: Text('postaCode')),
                          ],
                          rows: dataPersonalInformation
                              .map((item) => DataRow(cells: [
                                    DataCell(Text(item.firstName)),
                                    DataCell(Text(item.lastName)),
                                    DataCell(Text(item.email)),
                                    DataCell(Text(item.dateOfBirth)),
                                    DataCell(Text(item.address)),
                                    DataCell(Text(item.phoneNumber)),
                                    DataCell(Text(item.postalCode)),
                                  ]))
                              .toList(),
                        )
                      ]))))
    ]);
  }
}


/*
const Text(
                    'PersonalInformationRepository',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('firstName')),
                      DataColumn(label: Text('lastName')),
                      DataColumn(label: Text('email')),
                      DataColumn(label: Text('dateOfBirth')),
                      DataColumn(label: Text('address')),
                      DataColumn(label: Text('PhoneNumber')),
                      DataColumn(label: Text('postaCode')),
                    ],
                    rows: data
                        .map((item) => DataRow(cells: [
                              DataCell(Text(item[0])),
                              DataCell(Text(item[1])),
                              DataCell(Text(item[2])),
                              DataCell(Text(item[3])),
                              DataCell(Text(item[4])),
                              DataCell(Text(item[5])),
                              DataCell(Text(item[6])),
                            ]))
                        .toList(),
                  ),
                  const Text(
                    'ParamsPersonalInformation',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('firstName')),
                      DataColumn(label: Text('lastName')),
                      DataColumn(label: Text('email')),
                      DataColumn(label: Text('dateOfBirth')),
                      DataColumn(label: Text('address')),
                      DataColumn(label: Text('PhoneNumber')),
                      DataColumn(label: Text('postaCode')),
                    ],
                    rows: data
                        .map((item) => DataRow(cells: [
                              DataCell(Text(item[0])),
                              DataCell(Text(item[1])),
                              DataCell(Text(item[2])),
                              DataCell(Text(item[3])),
                              DataCell(Text(item[4])),
                              DataCell(Text(item[5])),
                              DataCell(Text(item[6])),
                            ]))
                        .toList(),
                  ),
                  const Text(
                    'PersonalInformationRepositoryImpl',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('firstName')),
                      DataColumn(label: Text('lastName')),
                      DataColumn(label: Text('email')),
                      DataColumn(label: Text('dateOfBirth')),
                      DataColumn(label: Text('address')),
                      DataColumn(label: Text('PhoneNumber')),
                      DataColumn(label: Text('postaCode')),
                    ],
                    rows: data
                        .map((item) => DataRow(cells: [
                              DataCell(Text(item[0])),
                              DataCell(Text(item[1])),
                              DataCell(Text(item[2])),
                              DataCell(Text(item[3])),
                              DataCell(Text(item[4])),
                              DataCell(Text(item[5])),
                              DataCell(Text(item[6])),
                            ]))
                        .toList(),
                  ),
                  const Text(
                    'PersonalInformationMaping',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('firstName')),
                      DataColumn(label: Text('lastName')),
                      DataColumn(label: Text('email')),
                      DataColumn(label: Text('dateOfBirth')),
                      DataColumn(label: Text('address')),
                      DataColumn(label: Text('PhoneNumber')),
                      DataColumn(label: Text('postaCode')),
                    ],
                    rows: data
                        .map((item) => DataRow(cells: [
                              DataCell(Text(item[0])),
                              DataCell(Text(item[1])),
                              DataCell(Text(item[2])),
                              DataCell(Text(item[3])),
                              DataCell(Text(item[4])),
                              DataCell(Text(item[5])),
                              DataCell(Text(item[6])),
                            ]))
                        .toList(),
                  ),
                  const Text(
                    'PersonalInformationRemoteDataSource',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('firstName')),
                      DataColumn(label: Text('lastName')),
                      DataColumn(label: Text('email')),
                      DataColumn(label: Text('dateOfBirth')),
                      DataColumn(label: Text('address')),
                      DataColumn(label: Text('PhoneNumber')),
                      DataColumn(label: Text('postaCode')),
                    ],
                    rows: data
                        .map((item) => DataRow(cells: [
                              DataCell(Text(item[0])),
                              DataCell(Text(item[1])),
                              DataCell(Text(item[2])),
                              DataCell(Text(item[3])),
                              DataCell(Text(item[4])),
                              DataCell(Text(item[5])),
                              DataCell(Text(item[6])),
                            ]))
                        .toList(),
                  ),
                  const Text(
                    'PersonalInformationRemoteDataSourceImpl',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('firstName')),
                      DataColumn(label: Text('lastName')),
                      DataColumn(label: Text('email')),
                      DataColumn(label: Text('dateOfBirth')),
                      DataColumn(label: Text('address')),
                      DataColumn(label: Text('PhoneNumber')),
                      DataColumn(label: Text('postaCode')),
                    ],
                    rows: data
                        .map((item) => DataRow(cells: [
                              DataCell(Text(item[0])),
                              DataCell(Text(item[1])),
                              DataCell(Text(item[2])),
                              DataCell(Text(item[3])),
                              DataCell(Text(item[4])),
                              DataCell(Text(item[5])),
                              DataCell(Text(item[6])),
                            ]))
                        .toList(),
                  ),

                  */