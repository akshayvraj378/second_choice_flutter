
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/product_model.dart';
import 'confirmation.dart';

const adharType = 'adhar';
const panType = 'pan';

class Book extends StatefulWidget {
  final ProductModel productModel;

  Book({Key? key, required this.productModel}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  File? _adharImage;
  File? _panImage;
  final picker = ImagePicker();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _advanceAmountController =
      TextEditingController();

  static final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');
  static final RegExp pincodeRegExp = RegExp(r'^[1-9][0-9]{5}$');
  static final RegExp panRegExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
  static final RegExp aadhaarRegExp = RegExp(r'^[0-9]{12}$');
  static final RegExp advanceAmountRegExp = RegExp(r'\d{5,}$');

  String dist = 'District';

  final List<String> items = [
    'Kasargod',
    'Kanur',
    'Kozhikode',
    'Wayanad',
    'Malapuram',
    'Palakad',
    'Thrishur',
    'Ernakulam',
    'Eduki',
    'Kottayam',
    'Alapuzha',
    'Pathanam Thitta',
    'Kollam',
    'Thiruvananthapuram',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Book Your Car'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(decoration: BoxDecoration( gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.transparent,
          ],
        )),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Card(
                    child: Image.network("${widget.productModel.carimage![0]}"),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 35, top: 1, bottom: 1, right: 1),
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
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${widget.productModel.carname}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 20, bottom: 8, right: 8),
                                child: Row(
                                  children: [
                                    Icon(Icons.currency_rupee),
                                    Text("${widget.productModel.prize}"),
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
                                      "${widget.productModel.prize}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                    leading:
                        Text('$dist', style: TextStyle(color: Colors.white)),
                    tileColor: Colors.white24,
                    shape: OutlineInputBorder(),
                    trailing: DropdownButton(
                      dropdownColor: Colors.black,
                      iconSize: 40,
                      style: TextStyle(color: Colors.white),
                      borderRadius: BorderRadius.circular(27),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items,
                              style: TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dist = newValue!;
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
                              child: Card(
                                color: Colors.white30,
                                child: _adharImage == null
                                    ? Center(
                                        child: IconButton(
                                            onPressed: () =>
                                                _showSelectionDialog(adharType),
                                            icon: Icon(Icons.camera_alt)))
                                    : Image.file(_adharImage!,
                                        fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Upload your PAN Card',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              width: 170,
                              height: 160,
                              child: Card(
                                color: Colors.white30,
                                child: _panImage == null
                                    ? Center(
                                        child: IconButton(
                                            onPressed: () =>
                                                _showSelectionDialog(panType),
                                            icon: Icon(Icons.camera_alt)))
                                    : Image.file(_panImage!, fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
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
                              MaterialStateProperty.all(Colors.brown),
                          fixedSize: MaterialStateProperty.all(Size(190, 50)),
                        ),
                        onPressed: _proceedButtonPressed,
                        child: Text('Proceed'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showSelectionDialog(String type) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.camera, type);
                  },
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.gallery, type);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _getImage(ImageSource source, String type) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        if (type == adharType) {
          _adharImage = File(pickedFile.path);
        } else if (type == panType) {
          _panImage = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  void _proceedButtonPressed() {
    if (_formKey.currentState!.validate()) {
      if (_panImage == null || _adharImage == null) {
        _showErrorMessage('Please upload both PAN and Aadhaar');
        return;
      }

      String name = _nameController.text;
      String address = _addressController.text;
      String pincode = _pincodeController.text;
      String panNumber = _panController.text;
      String aadhaarNumber = _aadhaarController.text;
      String advanceAmount = _advanceAmountController.text;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationPage(
            name: name,
            address: address,
            pincode: pincode,
            dist: dist,
            panNumber: panNumber,
            aadhaarNumber: aadhaarNumber,
            advanceAmount: advanceAmount,
            panImage: _panImage!,
            adharImage: _adharImage!,
          ),
        ),
      );
    }
  }

  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
