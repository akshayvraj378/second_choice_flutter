import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/cart_controller.dart';
import '../../model/product_model.dart';
import 'booking_page.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel productModel;

  ProductDetails({Key? key, required this.productModel}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  User? user = FirebaseAuth.instance.currentUser;
  final CartItemController _cartItemController = Get.put(CartItemController());

  void makePhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Vehicle Detail'),
      ),
      body: Container(decoration: BoxDecoration( gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black,
          Colors.transparent,
        ],
      )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCarImage(),
              _buildDetailsCard(),
              _buildImageGrid(),
              _buildTabs(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: Colors.black,
        destinations: [
          _buildNavigationButton(
            label: 'Let\'s Talk',
            color: Colors.teal,
            onPressed: () => makePhoneCall('9744151527'),
          ),
          _buildNavigationButton(
            label: 'Book Now',
            color: Colors.grey,
            onPressed: () =>
                Get.to(() => Book(productModel: widget.productModel)),
          ),
        ],
      ),
    );
  }

  Widget _buildCarImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.grey,
                ),
              ],
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    "${widget.productModel.carimage![0]}",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13, top: 0, left: 40, right: 40),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            _buildDetailText(
                "${widget.productModel.carname}", FontWeight.w900, 20),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDetailRow(Icons.calendar_today_rounded,
                    "${widget.productModel.modelyear}"),
                _buildDetailRow(
                    Icons.speed_rounded, "${widget.productModel.kms}"),
                _buildDetailRow(
                    Icons.info_outline_rounded, "${widget.productModel.fuel}"),
              ],
            ),
            _buildPriceSection(),
            const Padding(
              padding: EdgeInsets.all(13.0),
              child: Divider(),
            ),
            _buildDetailsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailText(String text, FontWeight fontWeight, double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.brown),
              Text(text),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSection() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Row(
              children: [
                const Icon(Icons.currency_rupee),
                Text(
                  "${widget.productModel.prize}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailsRow(Icons.calendar_month,
                  "${widget.productModel.modelyear}", 'Year'),
              _buildDetailsRow(Icons.imagesearch_roller,
                  "${widget.productModel.color}", 'Color'),
              _buildDetailsRow(
                  Icons.speed_outlined, "${widget.productModel.kms}", 'Kms'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailsRow(Icons.person_2_outlined,
                  "${widget.productModel.owner}", 'Owner'),
              _buildDetailsRow(Icons.directions_car_outlined,
                  "${widget.productModel.fuel}", 'Fuel'),
              _buildDetailsRow(Icons.speed_outlined,
                  "${widget.productModel.milage}", 'Mileage'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailsRow(Icons.network_ping_rounded,
                  "${widget.productModel.engine}", 'Engine'),
              _buildDetailsRow(Icons.verified_user_outlined,
                  "${widget.productModel.insure}", 'Insurance'),
              _buildDetailsRow(Icons.ad_units_sharp,
                  "${widget.productModel.polution}", 'Polution'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsRow(IconData icon, String text, String label) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(icon, color: Colors.brown),
              Text(text),
              Text(label),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: Card(
        color: Colors.grey[350],
        margin: const EdgeInsets.only(left: 40, top: 30, bottom: 30, right: 40),
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: GridView.builder(
            itemCount: widget.productModel.carimage?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: GestureDetector(
                    onTap: () => _showImageDialog(index),
                    child: CachedNetworkImage(
                      imageUrl: "${widget.productModel.carimage![index]}",
                      fit: BoxFit.cover,
                    )),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showImageDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Card(
          color: Colors.black,
          child: SizedBox(
            width: double.infinity,
            height: 440,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${widget.productModel.carname}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                    child: CachedNetworkImage(
                  imageUrl: "${widget.productModel.carimage![index]}",
                  fit: BoxFit.cover,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: Card(
        color: Colors.grey[350],
        margin: const EdgeInsets.only(left: 40, top: 30, bottom: 30, right: 40),
        child: DefaultTabController(
          length: 3,
          child: SizedBox(
            child: Column(
              children: [
                const TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: 'Feature'),
                    Tab(text: 'Specifications'),
                    Tab(text: 'OverView'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildListView(
                          widget.productModel.features?.cast<String>()),
                      _buildListView(
                          widget.productModel.specification?.cast<String>()),
                      _buildListView(
                          widget.productModel.overview?.cast<String>()),
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

  Widget _buildListView(List<String>? items) {
    return ListView.builder(
      itemCount: items?.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${items![index]}",
          ),
        );
      },
    );
  }

  Widget _buildNavigationButton(
      {required String label,
      required Color color,
      required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide.none),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
