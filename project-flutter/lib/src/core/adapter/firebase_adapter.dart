// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
  Future<Map<String, dynamic>> getAll() async {
    Map<String, dynamic> documentsData = {};

    try {
      final query = await firebaseFirestore.collection('Tasks').get();

      for (var element in query.docs) {
        documentsData.addAll(element.data());
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

      await query.add(json.decode(body) as Map<String, String>);
    } on BaseException {
      throw ErrorException();
    }
  }

  @override
  Future<void> put(String id, String body) async {
    try {
      CollectionReference query =
          FirebaseFirestore.instance.collection('Tasks');

      await query.doc(id).update(json.decode(body) as Map<String, String>);
    } on BaseException {
      throw ErrorException();
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      CollectionReference query =
          FirebaseFirestore.instance.collection('minhaColecao');

      final snapshot = await query.get();

      for (var doc in snapshot.docs) {
        await query.doc(doc.id).delete();
      }
    } on BaseException {
      throw ErrorException();
    }
  }
}
