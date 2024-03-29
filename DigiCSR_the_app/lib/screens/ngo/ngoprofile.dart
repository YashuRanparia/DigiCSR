import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/models/BoardMember.dart';
import 'package:digicsr/services/ngo_profile_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../widgets/radoi_button.dart';

class ProfileScreenForNGO extends StatefulWidget {
  const ProfileScreenForNGO({super.key});

  @override
  State<ProfileScreenForNGO> createState() => _ProfileScreenForNGOState();
}

class _ProfileScreenForNGOState extends State<ProfileScreenForNGO> {


  Future<void> pick_ngo_logo() async {
    // Clear previous files
    setState(() {
      ngo.ngo_logo = null;
    });

    // Pick files using file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      allowMultiple: false,
    );

    // If files are picked, update state
    if (result != null) {
      setState(() {
        ngo.ngo_logo = File(result.files.single.path!);
        print('Logo Picked');
      });
    }
  }

  final _items1 = [
    MultiSelectItem<String>('Option 1', "Male"),
    MultiSelectItem<String>('Option 2', "Female"),
    MultiSelectItem<String>('Option 3', "others"),
  ];
  String countryValue = '';
  String? stateValue = '';
  String? cityValue = '';

  List<String> _selectedOptions = [];
  final _items = [
    MultiSelectItem<String>('Option 1', "Rural Development"),
    MultiSelectItem<String>('Option 2', "Encouraging Sports"),
    MultiSelectItem<String>('Option 3', "Clean Ganga Fund"),
    MultiSelectItem<String>('Option 4', "Swachh Bharat"),
    MultiSelectItem<String>('Option 5', "Health & Sanitation"),
    MultiSelectItem<String>(
        'Option 6', "Education, Differently Abled, Livelihood"),
    MultiSelectItem<String>('Option 7',
        "Gender Equality, Women Empowerment, Old Age Homes, Reducing Inequalities"),
    MultiSelectItem<String>(
        'Option 8', "Environment, Animal Welfare, Conservation of Resources"),
    MultiSelectItem<String>('Option 9', "Slum Development"),
    MultiSelectItem<String>('Option 10', "Heritage Art And Culture"),
    MultiSelectItem<String>(
        'Option 11', "Prime Minister National Relief Funds"),
    MultiSelectItem<String>('Option 12', "others"),
  ];

  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Card(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Card(
                      elevation: 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    "Ngo Information",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                          children: [
                            Expanded(child: Container()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    await pick_ngo_logo();
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black38,
                                              width: 1.1),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.black38,
                                        size: 60,
                                      )),
                                ),
                                Text(
                                  'Profile Logo',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Gotham',
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                          Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 10),
          child: TextFormField(
            textDirection: TextDirection.ltr,
            // keyboardType: widget.keyboardType,
            // inputFormatters: widget.inputFormatters,
            controller: TextEditingController(text: ngo.ngo_name),
            onChanged: (value) {
              ngo.ngo_name = value;
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 0.9,
                        color: Colors.black54)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 0.9,
                        color: Colors.black54)),
                labelText: 'Ngo Name',
                prefixIcon: Icon(Icons.group_outlined),
                hintStyle: TextStyle(fontSize: 16),
                hintText: 'Enter  Name Of Ngo',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primary))),
          ),
        ),
      ],
    ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 10),
          child: TextFormField(
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.emailAddress,
            // inputFormatters: widget.inputFormatters,
            controller: TextEditingController(text: ngo.email),
            onChanged: (value) {
              ngo.email = value;
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 0.9,
                        color: Colors.black54)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 0.9,
                        color: Colors.black54)),
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                hintStyle: TextStyle(fontSize: 16),
                hintText: 'Enter Email of the ngo',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primary))),
          ),
        ),
      ],
    ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 10),
          child: TextFormField(
            textDirection: TextDirection.ltr,
            // keyboardType: widget.keyboardType,
            inputFormatters: [
              LengthLimitingTextInputFormatter(100)
            ],
            controller: TextEditingController(text: ngo.summmary),
            onChanged: (value) {
              ngo.summmary = value;
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 0.9,
                        color: Colors.black54)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 0.9,
                        color: Colors.black54)),
                labelText: 'Ngo Summery',
                prefixIcon: Icon(Icons.picture_in_picture_rounded),
                hintStyle: TextStyle(fontSize: 16),
                hintText: 'Enter text......',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primary))),
          ),
        ),
      ],
    ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 10),
          child: TextFormField(
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(4),
              FilteringTextInputFormatter.digitsOnly
            ],
            controller: TextEditingController(text: (ngo.establishment_year == null)?'':ngo.establishment_year.toString()),
            onChanged: (value) {
              ngo.establishment_year = int.parse(value);
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 0.9,
                        color: Colors.black54)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 0.9,
                        color: Colors.black54)),
                labelText: 'Year Of Establishment',
                prefixIcon: Icon(Icons.date_range),
                hintStyle: TextStyle(fontSize: 16),
                hintText: 'YYYY',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primary))),
          ),
        ),
      ],
    ),
                          SizedBox(
                            height: 10,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 10),
                                child: TextFormField(
                                  textDirection: TextDirection.ltr,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: TextEditingController(
                                      text: ngo.phone),
                                  onChanged: (value) {
                                    ngo.phone = value;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      labelText: 'Phone no.',
                                      prefixIcon: Icon(Icons.phone),
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Enter Phone no. of Ngo office',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: primary))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 10),
                                child: TextFormField(
                                  textDirection: TextDirection.ltr,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller:
                                      TextEditingController(text: ngo.pincode),
                                  onChanged: (value) {
                                    ngo.pincode = value;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      labelText: 'Pincode',
                                      prefixIcon: Icon(Icons.location_pin),
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Enter Pincode for NGO',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: primary))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Text(
                              'Location of the Ngo',
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: CSCPicker(
                              onCountryChanged: (country) {
                                setState(() {
                                  countryValue = country;
                                });
                              },
                              onStateChanged: (state) {
                                ngo.state = state;
                                setState(() {
                                  stateValue = state;
                                });
                              },
                              onCityChanged: (city) {
                                ngo.city = city;
                                setState(() {
                                  cityValue = city;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 10),
                                child: TextFormField(
                                  textDirection: TextDirection.ltr,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(100)
                                  ],
                                  controller: TextEditingController(
                                      text: 
                                      (ngo.csr_budget == null)?'':ngo.csr_budget.toString()
                                      ),
                                  onChanged: (value) {
                                    ngo.csr_budget = int.parse(value);
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      labelText: 'CSR Budget of this year',
                                      prefixIcon: Icon(
                                          Icons.picture_in_picture_rounded),
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Enter CSR Budget',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: primary))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Sector  to provide CSR",
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: MultiSelectDialogField<String>(
                              decoration: BoxDecoration(color: Colors.white),
                              title: Text('Select Options'),
                              items: _items,
                              initialValue: _selectedOptions,
                              onConfirm: (values) {
                                setState(() {
                                  ngo.sectors = values;
                                  _selectedOptions = values;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Area of operation",
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 15),
                            child: MultiSelectDialogField<String>(
                              buttonText: Text(
                                'Areas of Operation',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                              dialogHeight:
                                  MediaQuery.of(context).size.height * 0.6,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black38,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              title: Text('Select Options'),
                              items: Indianstates,
                              checkColor: primary,
                              initialValue: _selectedOptions,
                              onConfirm: (values) {
                                setState(() {
                                   ngo.operation_areas = values;
                                   _selectedOptions = values;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    "BoardMember",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          // TextFormFieldButton(
                          //   "Member Name",
                          //   Text2: "Enter  Name Of Board",
                          //   controller: board_member.bm_name,
                          //   prefixIcons: Icon(Icons.person),
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 10),
                                child: TextFormField(
                                  textDirection: TextDirection.ltr,
                                  // keyboardType: widget.keyboardType,
                                  // inputFormatters: widget.inputFormatters,
                                  controller: TextEditingController(
                                      text: board_member.bm_name),
                                  onChanged: (value) {
                                    board_member.bm_name = value;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      labelText: 'Enter  Name Of Board',
                                      prefixIcon: Icon(Icons.person),
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Enter  Name Of Board',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: primary))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          addRadioButton(),
                          // TextFormFieldButton(
                          //   "DIN",
                          //   Text2: "Enter DIN Number",
                          //   controller: board_member.bm_phone,
                          //   prefixIcons: Icon(Icons.numbers),
                          //   keyboardType: TextInputType.number,
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.digitsOnly
                          //   ],
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 10),
                                child: TextFormField(
                                  textDirection: TextDirection.ltr,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: TextEditingController(
                                      text: board_member.bm_din),
                                  onChanged: (value) {
                                    board_member.bm_din = value;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      labelText: 'DIN',
                                      prefixIcon: Icon(Icons.numbers),
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Enter DIN Number',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: primary))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 10),
                                child: TextFormField(
                                  textDirection: TextDirection.ltr,
                                  // keyboardType: widget.keyboardType,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(100),
                                  ],
                                  controller: TextEditingController(
                                      text: board_member.bm_designation),
                                  onChanged: (value) {
                                    board_member.bm_designation = value;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      labelText: 'Designation',
                                      prefixIcon: Icon(Icons.work),
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Enter Designation',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: primary))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // TextFormFieldButton(
                          //   "Phone no.",
                          //   Text2: "Enter the Phone no.",
                          //   controller: board_member.bm_phone,
                          //   prefixIcons: Icon(Icons.phone),
                          //   keyboardType: TextInputType.number,
                          //   inputFormatters: [
                          //     LengthLimitingTextInputFormatter(10),
                          //     FilteringTextInputFormatter.digitsOnly
                          //   ],
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 10),
                                child: TextFormField(
                                  textDirection: TextDirection.ltr,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: TextEditingController(
                                      text: board_member.bm_phone),
                                  onChanged: (value) {
                                    board_member.bm_phone = value;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 0.9,
                                              color: Colors.black54)),
                                      labelText: 'Phone no.',
                                      prefixIcon: Icon(Icons.phone),
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'Enter the Phone no.',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: primary))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(primary)
                                ),
                                  onPressed: () {
                                    // ngo.board_members!.add(board_member);
                                    List<BoardMember> temp = [];
                                    temp.add(board_member);
                                    ngo.board_members = temp;
                                    if(ngo.board_members == null) print('No boardmembers');
                                    print(board_member.bm_name);
                                    // print(temp[0].bm_name);
                                  },
                                  child: Text("Add member")))
                        ],
                      ),
                    ),
                    Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(primary)
                                ),
                            onPressed: () async{

                              try {
                              await AddNgoProfile();
                              if (ngo.ngo_logo != null) postNgoLogo();
                              var snackBar = SnackBar(
                                backgroundColor: primary,
                                padding: EdgeInsets.only(bottom: 20,top: 20),content: Text('Your Rfp has been raised',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,),));
                               await ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               Navigator.pop(context);
                            } catch (e) {
                              var snackBar = SnackBar(
                                backgroundColor: secondary,
                                padding: EdgeInsets.only(bottom: 20,top: 20),content: Text('${e}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,),));
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            },
                            child: Text("Save")))
                  ],
                )
              ])),
        ));
  }
}
