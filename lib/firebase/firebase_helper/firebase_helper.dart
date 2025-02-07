import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

import '../../utils/sizes.dart';

class DatabaseHelper {
  DatabaseHelper._internal();

  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(Map<String, dynamic> userData) async {
    await _firestore.collection('users').add(userData);
  }

  Future<void> addOrUpdateImage(Map<String, dynamic> userData) async {
    final querySnapshot = await _firestore.collection("images").get();
    if (querySnapshot.docs.isEmpty) {
      await _firestore.collection('images').add(userData);
    } else {
      await _firestore
          .collection("images")
          .doc(querySnapshot.docs.first.id)
          .update(userData);
    }
  }

  Future<void> updateUser(String userId, Map<String, dynamic> userData) async {
    return await _firestore.collection('users').doc(userId).update(userData);
  }

  Future<void> deleteUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => {
                'id': doc.id,
                ...doc.data(),
              })
          .toList();
    });
  }

  Stream<List<Map<String, dynamic>>> getImageData() {
    return _firestore.collection('images').snapshots().map(
      (snapshot) {
        return snapshot.docs
            .map(
              (doc) => {
                'id': doc.id,
                ...doc.data(),
              },
            )
            .toList();
      },
    );
  }
}

class StudentApp extends StatefulWidget {
  const StudentApp({super.key});

  @override
  _StudentAppState createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollnoController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _nameControllerUpdate = TextEditingController();
  final TextEditingController _rollnoControllerUpdate = TextEditingController();
  final TextEditingController _ageControllerUpdate = TextEditingController();

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> _addStudent() async {
    final userData = {
      "name": _nameController.text,
      'rollno': int.parse(_rollnoController.text),
      'age': int.parse(_ageController.text),
    };
    _nameController.clear();
    _rollnoController.clear();
    _ageController.clear();
    await _databaseHelper.addUser(userData);
  }

  Future<void> _updateStudent(String userId) async {
    final userData = {
      "name": _nameControllerUpdate.text,
      'rollno': int.parse(_rollnoControllerUpdate.text),
      'age': int.parse(_ageControllerUpdate.text),
    };

    await _databaseHelper.updateUser(userId, userData);
    Navigator.of(context).pop();
  }

  final RxnString imagePath = RxnString();
  String? imageUrl;

  Future<void> pickImage() async {
    ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
    }
    uploadImageToFirebase(image!);
  }

  Future<void> uploadImageToFirebase(XFile image) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('student_images/${Path.basename(image.path)}');

    final UploadTask uploadTask = storageRef.putFile(File(image.path));
    await uploadTask;

    imageUrl = await storageRef.getDownloadURL();
    final userData = {
      "image": imageUrl,
    };
    _databaseHelper.addOrUpdateImage(userData);
  }

  void abc() {
    TextEditingController zxc = TextEditingController();

    List<Map<String, dynamic>> myList = [
      {"a": ""},
      {"a": ""}
    ];
    bool variable = myList.any(
      (e) => e["a"] == zxc,
    );
    final xyz = myList.firstWhere(
      (e) => e["a"] == zxc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Student Database')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Center(
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: _databaseHelper.getImageData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final studentDataList = snapshot.data;
                    final studentImage =
                        (studentDataList != null && studentDataList.isNotEmpty)
                            ? studentDataList[0]['image']
                            : null;
                    return GestureDetector(
                      onTap: pickImage,
                      child: Obx(
                        () => CircleAvatar(
                          radius: 60,
                          backgroundImage: (imagePath.value != null)
                              ? FileImage(File(imagePath.value!))
                              : (studentImage != null
                                  ? NetworkImage(studentImage)
                                  : const NetworkImage(
                                      "https://img.icons8.com/ios-filled/50/000000/add.png")),
                        ),
                      ),
                    );
                  },
                ),
              ),
              TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter(
                      RegExp('[a-z A-Z]'),
                      allow: true,
                    )
                  ],
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name')),
              TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9]'), allow: true)
                  ],
                  controller: _rollnoController,
                  decoration: const InputDecoration(labelText: 'Roll No')),
              TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9]'), allow: true)
                  ],
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Age')),
              XSizes.boxHeight(0.01),
              ElevatedButton(
                  onPressed: _addStudent, child: const Text('Add Student')),
              Expanded(
                /// type of stream which it will monitor
                /// this stream builder monitors collection/folder in database not list
                /// it triggers stream builder everytime change happens specific collection('users')
                child: StreamBuilder<List<Map<String, dynamic>>>(

                    /// here stream gets all Stream type List Data so it can be monitored
                    stream: _databaseHelper.getUsersStream(),

                    /// here this List data is passed into builder as parameter
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('No students available.'));
                      }

                      /// the List data received as parameter is fetched and stored in List of maps named students
                      final students = snapshot.data!;
                      return ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return Container(
                            margin: const EdgeInsets.all(8),
                            height: 85,
                            width: context.width,
                            color: Colors.grey.shade200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      student['name'],
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      '${student['age']}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "${student['rollno']}",
                                      style: const TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    _nameControllerUpdate.text =
                                        student['name'];
                                    _rollnoControllerUpdate.text =
                                        student['rollno'].toString();
                                    _ageControllerUpdate.text =
                                        student['age'].toString();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            height: XSizes.xHeight(0.43),
                                            child: Column(
                                              children: [
                                                XSizes.boxHeight(0.02),
                                                const Text(
                                                  'Edit Info here',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                                XSizes.boxHeight(0.02),
                                                TextFormField(
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter(
                                                        RegExp('[a-z A-Z]'),
                                                        allow: true)
                                                  ],
                                                  controller:
                                                      _nameControllerUpdate,
                                                  decoration: const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(8),
                                                      hintText:
                                                          'Enter Name here',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)))),
                                                ),
                                                XSizes.boxHeight(0.02),
                                                TextFormField(
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter(
                                                        RegExp('[0-9]'),
                                                        allow: true)
                                                  ],
                                                  controller:
                                                      _rollnoControllerUpdate,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(8),
                                                      hintText:
                                                          'Enter Roll No here',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)))),
                                                ),
                                                XSizes.boxHeight(0.02),
                                                TextFormField(
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter(
                                                        RegExp('[0-9]'),
                                                        allow: true)
                                                  ],
                                                  controller:
                                                      _ageControllerUpdate,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.all(8),
                                                      hintText:
                                                          'Enter Age here',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)))),
                                                ),
                                                XSizes.boxHeight(0.02),
                                                TextButton(
                                                    onPressed: () {
                                                      _updateStudent(
                                                          student['id']);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.green),
                                                    child: const Text(
                                                      'Update',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  style: IconButton.styleFrom(
                                      fixedSize: const Size(60, 60)),
                                  child: const Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.red),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await _databaseHelper
                                        .deleteUser(student['id']);
                                  },
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  style: IconButton.styleFrom(
                                      fixedSize: const Size(60, 60)),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
