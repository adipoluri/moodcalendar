
import 'package:cloud_firestore/cloud_firestore.dart';

class SiteUser {
  String uid;
  String name;
  Timestamp lastSubmit;
  Map calendar;

  SiteUser(this.uid,this.name, this.lastSubmit, this.calendar);

}