import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String adSoyad;
  final String eposta;
  final String sifre;
  final String userUid;
  UserModel({
      required this.adSoyad,
      required this.eposta,
      required this.sifre,
      required this.userUid,

  } );
  factory UserModel.fromDocument(DocumentSnapshot doc){
    return UserModel(adSoyad: doc['adSoyad'], eposta: doc['eposta'], sifre: doc['sifre'], userUid: doc['userUid']);
  }
}