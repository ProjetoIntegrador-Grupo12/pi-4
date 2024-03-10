// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_senac/src/core/adapter/firebase_client.dart';
import 'package:todo_senac/src/core/error/exception.dart';

class FirebaseAdapter implements FirebaseClient {
  final FirebaseFirestore firebaseFirestore;

  FirebaseAdapter({
    required this.firebaseFirestore,
  });

  @override
  Future<void> delete(String id) async {
    try {
      await firebaseFirestore.collection('Tasks').doc(id).delete();
    } on BaseException {
      throw ErrorException();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    List<Map<String, dynamic>> documentsData = [];

    try {
      QuerySnapshot<Map<String, dynamic>> task =
          await FirebaseFirestore.instance.collection('Tasks').get();

      for (var element in task.docs) {
        var item = element.data();

        item['id'] = element.id;
        documentsData.add(
          item,
        );
      }

      return documentsData;
    } on BaseException {
      throw ErrorException();
    }
  }

  @override
  Future<void> post(String body) async {
    try {
      CollectionReference query =
          FirebaseFirestore.instance.collection('Tasks');

      await query.add(json.decode(body) as Map<String, dynamic>);

      

      
    } on BaseException {
      throw ErrorException();
    }
  }

  @override
  Future<void> put(String id, String body) async {
    try {
      CollectionReference query =
          FirebaseFirestore.instance.collection('Tasks');

      await query.doc(id).update(json.decode(body) as Map<String, dynamic>);
    } catch (error) {
      throw ErrorException();
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      CollectionReference query =
          FirebaseFirestore.instance.collection('Tasks');

      final snapshot = await query.get();

      for (var doc in snapshot.docs) {
        await query.doc(doc.id).delete();
      }
    } on BaseException {
      throw ErrorException();
    }
  }
}
