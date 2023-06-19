import 'dart:convert';

import 'package:digicsr/widgets/appbar.dart';
import 'package:digicsr/widgets/bottomnavigationbar.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../widgets/textformfield.dart';

class ProfileScreenForCompany extends StatefulWidget {
  const ProfileScreenForCompany({super.key});

  @override
  State<ProfileScreenForCompany> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenForCompany> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  void save() async {
    var formdata = FormData.fromMap(
      {
        'company_name': company.company_name,
        'summary': company.summary,
        'city': company.company_city,
        'state': company.company_state,
        'pincode': company.pincode,
        'establishment_year': company.establishment_year.toString(),
        'cp_name': company.cp_name,
        'cp_email': company.cp_email,
        'cp_designation': company.cp_designation,
        'cp_phone': company.cp_phone,
        'tax_comp': company.tax_comp,
        'sectors': company.sectors
      },
    );
    try {
      var token = await fetchToken();
      print(token.toString());
      // var resp = await http.post(Uri.parse('http://192.168.114.94:4000/company/add-profile/:id'),
      var dio = Dio();
      var response = await dio.post(ipInfo + '/company/add-profile',
          data: formdata,
          options: Options(
            headers: {
              'Context-Type': 'application/json;charSet=UTF-8',
              'authorization': token.toString()
            },
          ));
      if (response.statusCode == 200) {
        print('Upload successful');
      } else {
        print('Upload failed');
      }

      // var resp = await http.post(
      //   Uri.parse(ipInfo + '/company/add-profile'),
      //   headers: {
      //     'Context-Type': 'application/json;charSet=UTF-8',
      //     'authorization': token.toString()
      //   },
      //   body: {
      //     'company_name': company.company_name,
      //     'summary': company.summary,
      //     'city': company.company_city,
      //     'state': company.company_state,
      //     'pincode': company.pincode,
      //     'establishment_year': company.establishment_year.toString(),
      //     'cp_name': company.cp_name,
      //     'cp_email': company.cp_email,
      //     'cp_designation': company.cp_designation,
      //     'cp_phone': company.cp_phone,
      //     'tax_comp': jsonEncode(company.tax_comp!),
      //     'sectors': jsonEncode(company.sectors!)
      //   },
      // );
      // print(resp.body);
    } on Exception catch (e) {
      print(e);
    }
  }

  String countryValue = '';
  String? stateValue = '';
  String? cityValue = '';
  List<String> _selectedOptions = [];
  final _items = [
    MultiSelectItem<String>('Rural Development', "Rural Development"),
    MultiSelectItem<String>('Encouraging Sports', "Encouraging Sports"),
    MultiSelectItem<String>('Clean Ganga Fund', "Clean Ganga Fund"),
    MultiSelectItem<String>('Swachh Bharat', "Swachh Bharat"),
    MultiSelectItem<String>('Health & Sanitation', "Health & Sanitation"),
    MultiSelectItem<String>('Education, Differently Abled, Livelihood',
        "Education, Differently Abled, Livelihood"),
    MultiSelectItem<String>(
        'Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities',
        "Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
    MultiSelectItem<String>(
        'Environment, Animal Welfare, Conservation of Resources',
        "Environment, Animal Welfare, Conservation of Resources"),
    MultiSelectItem<String>('Slum Development', "Slum Development"),
    MultiSelectItem<String>(
        'Heritage Art And Culture', "Heritage Art And Culture"),
    MultiSelectItem<String>('Prime Minister National Relief Funds',
        "Prime Minister National Relief Funds"),
    MultiSelectItem<String>('others', "others"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, fixedSize: Size(300, 42)),
                child: Text(
                  'COMPANY INFORMATION',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              TextFormFieldButton("Company Name",
                  Text2: "Enter Full Name Of Company",
                  controller: company.company_name),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton(
                "Year Of Establishment",
                Text2: "yyyy",
                controller: company.establishment_year,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              TextFormFieldButton(
                "Pincode",
                Text2: "Enter Pincode",
                controller: company.pincode,
                inputFormatters: [
                  // LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton(
                "Company Summery",
                Text2: 'Enter text',
                controller: company.summary,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Location of the Company',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              // CSCPicker(
              //   onCountryChanged: (country) {
              //     company.company_country = country;
              //     setState(() {
              //       countryValue = country;
              //     });
              //   },
              //   onStateChanged: (state) {
              //     company.company_state = state;
              //     setState(() {
              //       stateValue = state;
              //     });
              //   },
              //   onCityChanged: (city) {
              //     company.company_city = city;
              //     setState(() {
              //       cityValue = city;
              //     });
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, fixedSize: Size(550, 42)),
                child: Text(
                  'Communication Person of the Company',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              TextFormFieldButton("Name",
                  Text2: 'Enter Name of the communication person',
                  controller: company.cp_name),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton("Email",
                  Text2: 'Enter email of communicatoin person',
                  controller: company.cp_email),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton(
                'Phone No.',
                Text2: 'Phone Number',
                controller: company.cp_phone,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormFieldButton('Designation of the communication person',
                  Text2: 'Enter Designation of the communication person',
                  controller: company.cp_designation),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sector  to provide CSR",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),

              Card(
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: MultiSelectDialogField<String>(
                    title: Text('Select Options'),
                    items: _items,
                    initialValue: _selectedOptions,
                    onConfirm: (values) {
                      company.sectors = values;
                      setState(() {
                        _selectedOptions = values;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Company Registration Certificate",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text('Upload file'),
                onPressed: () async {
                  var picked = await FilePicker.platform.pickFiles();
                  company.registration_certificate = picked;

                  if (picked != null) {
                    print(picked.files.first.name);
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        print(company.sectors);
                      },
                      child: Text("Save")))
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(companynav),
    );
  }
}
