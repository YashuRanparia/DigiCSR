import 'dart:io';

import 'package:file_picker/file_picker.dart';

class Company {
  // String? id;
  String? company_name;
  String? cin;
  String? email;
  String? summary;
  int? establishment_year;
  String? state;
  String? city;
  String? pincode;
  String? cp_name;
  String? cp_email;
  String? cp_designation;
  String? cp_phone;
  List<dynamic>? tax_comp;
  List<dynamic>? sectors;
  // File?
  File? registration_certificate;
  File? company_logo;
  File? certificate;
  String? cmp_logo_path;
  String? cmp_certificate_path;

  void updatedata(Company sample) {
    this.company_name = sample.company_name;
    this.cin = sample.cin;
    this.email = sample.email;
    this.summary = sample.summary;
    this.establishment_year = sample.establishment_year;
    this.state = sample.state;
    this.city = sample.city;
    this.pincode = sample.pincode;
    this.cp_name = sample.cp_name;
    this.cp_email = sample.cp_email;
    this.cp_designation = sample.cp_designation;
    this.cp_phone = sample.cp_phone;
    this.tax_comp = sample.tax_comp;
    this.sectors = sample.sectors;
  }

  Company({
    // this.id,
    this.company_name,
    this.cin,
    this.email,
    this.summary,
    this.establishment_year,
    this.state,
    this.city,
    this.pincode,
    this.cp_name,
    this.cp_email,
    this.cp_designation,
    this.cp_phone,
    this.tax_comp,
    this.sectors,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      // id: json['_id'],
      company_name: json['company_name'],
      cin: json['cin'],
      email: json['email'],
      summary: json['profile']['summary'],
      establishment_year: json['profile']['establishment_year'],
      state: json['profile']['location']['state'],
      city: json['profile']['location']['city'],
      pincode: json['profile']['location']['pincode'],
      cp_name: json['profile']['comunication_person']['cp_name'],
      cp_email: json['profile']['comunication_person']['cp_email'],
      cp_phone: json['profile']['comunication_person']['cp_phone'],
      cp_designation: json['profile']['comunication_person']['cp_designation'],
      tax_comp: json['profile']['tax_comp'],
      sectors: json['profile']['sectors'],
    );
  }
}
