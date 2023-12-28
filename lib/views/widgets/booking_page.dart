import 'package:flutter/material.dart';

import '../../model/home_model.dart';

class Book extends StatefulWidget {
  Loginmodel productModel;

  Book(
      {super.key,
      required this.productModel});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  String Dist = 'District';

  // List of items in our dropdown menu
  var items = [
    'Kasargod',
    'kanur',
    'Kozhikode',
    'Wayanad',
    'Malapuram',
    'Palakad',
    'Thrishur',
    'Ernakulam',
    'Eduki',
    'Kottayam',
    'alapuzha',
    'pathanam thitta',
    'kollam',
    'Thiruvananthapuram',
  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _advanceAmountController =
      TextEditingController();

  RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');
  RegExp pincodeRegExp = RegExp(r'^[1-9][0-9]{5}$');
  RegExp panRegExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
  RegExp aadhaarRegExp = RegExp(r'^[0-9]{12}$');
  RegExp advanceAmountRegExp = RegExp(r'^\d{5}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Book Your Car'),
          centerTitle: true),
      body: Form(
        key: _formKey,
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Card(
                          child: Image.network(
                              "${widget.productModel.carimage![0]}")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 35, top: 1, bottom: 1, right: 1),
                      child: Text(
                        'summary',
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 25, bottom: 10, top: 8, left: 25),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              color: Colors.blueGrey[200],
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Mercedes Benz CLA Class',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, top: 20, bottom: 8, right: 8),
                                  child: Row(
                                    children: [
                                      Icon(Icons.currency_rupee),
                                      Text(
                                        '71,00,000',
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(color: Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, bottom: 15, top: 1, left: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total'),
                                      Text(
                                        '71,00,000',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 1, bottom: 1, top: 1, left: 35),
                      child: Text(
                        'Enter your personal details',
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, top: 7, bottom: 8, right: 25),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            hintText: 'Name*',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Name';
                          } else if (!nameRegExp.hasMatch(value)) {
                            return 'Please Enter A Valid Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, top: 7, bottom: 8, right: 25),
                      child: TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                            hintText: 'Address*',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, top: 7, bottom: 8, right: 25),
                      child: TextFormField(
                        controller: _pincodeController,
                        decoration: InputDecoration(
                            hintText: 'Pincode*',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your PIN Code';
                          } else if (!pincodeRegExp.hasMatch(value)) {
                            return 'Please Enter A Valid PIN Code';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, top: 7, bottom: 8, right: 25),
                      child: ListTile(
                        leading: Text('$Dist',
                            style: TextStyle(color: Colors.white)),
                        tileColor: Colors.white24,
                        shape: OutlineInputBorder(),
                        trailing: DropdownButton(
                          dropdownColor: Colors.black,
                          iconSize: 40,
                          style: TextStyle(color: Colors.white),
                          borderRadius: BorderRadius.circular(27),
                          //       value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items,
                                  style: TextStyle(color: Colors.white)),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              //  dropdownvalue = newValue!;
                              Dist = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, top: 7, bottom: 8, right: 25),
                      child: TextFormField(
                        controller: _panController,
                        decoration: InputDecoration(
                            hintText: 'PAN Number*',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Upload Your PAN Number';
                          } else if (!panRegExp.hasMatch(value)) {
                            return 'Please Enter A Valid PAN Number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, top: 7, bottom: 8, right: 25),
                      child: TextFormField(
                        controller: _aadhaarController,
                        decoration: InputDecoration(
                            hintText: 'AADHAAR Number*',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Upload Your AADHAAR Number';
                          } else if (!aadhaarRegExp.hasMatch(value)) {
                            return 'Please Enter A Valid AADHAAR Number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, top: 7, bottom: 8, right: 25),
                      child: TextFormField(
                        controller: _advanceAmountController,
                        decoration: InputDecoration(
                            hintText: 'Advance Amount Eg:10000*',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Amount';
                          } else if (!advanceAmountRegExp.hasMatch(value)) {
                            return 'Please Enter More Than 10000';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('Upload your Adharcard',
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(
                                  width: 170,
                                  height: 160,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Card(
                                      color: Colors.white24,
                                      child: Icon(Icons.image),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text('Upload your PAN Card',
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(
                                  width: 170,
                                  height: 160,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Card(
                                      color: Colors.white24,
                                      child: Icon(Icons.image),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.brown),
                                  fixedSize:
                                      MaterialStatePropertyAll(Size(190, 50))),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Form is valid, perform necessary actions
                                  // Access field values using controllers:
                                  String name = _nameController.text;
                                  String address = _addressController.text;
                                  String pincode = _pincodeController.text;
                                  String panNumber = _panController.text;
                                  String aadhaarNumber =
                                      _aadhaarController.text;
                                  String advanceAmount =
                                      _advanceAmountController.text;

                                  // Perform actions with validated data here
                                }
                              },
                              child: Text('add to cart'
                                  )),
                        ],
                      ),
                    )
                  ]),
            )),
      ),
    );
  }
}
