import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:second_choice_flutter/model/home_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/controller.dart';

class Detailspages extends StatefulWidget {
  late Loginmodel productModel;
  Detailspages({super.key, required this.productModel});
  @override
  State<Detailspages> createState() => _DetailspagesState();
}

class _DetailspagesState extends State<Detailspages> {



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
      backgroundColor: Colors.black87,
      appBar: AppBar(actions: [IconButton(onPressed: () {

      }, icon: Icon(Icons.favorite_border)), IconButton(onPressed: () {

      }, icon: Icon(Icons.share))
      ],
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text('Vehicle Detail')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    decoration:  BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.grey,
                        )
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                          "${widget.productModel.carimage![0]}"
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(
                  bottom: 13, top: 0, left: 40, right: 40),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "${widget.productModel.carname}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today_rounded,
                                  color: Colors.brown),
                              Text("${widget.productModel.modelyear}",)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.speed_rounded, color: Colors.brown),
                              Text('59000 KM')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.info_outline_rounded,
                                  color: Colors.brown),
                              Text('Diesel')
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: Row(
                              children: [
                                Icon(Icons.currency_rupee),
                                Text(
                                  '71,00,000',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.calendar_month, color: Colors.brown),
                              Text('2014'),
                              Text('Year')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.imagesearch_roller,
                                  color: Colors.brown),
                              Text('Black'),
                              Text('Color')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.speed_outlined, color: Colors.brown),
                              Text('59000'),
                              Text('Kms')
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.person_2_outlined,
                                  color: Colors.brown),
                              Text('2'),
                              Text('Owner')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.directions_car_outlined,
                                  color: Colors.brown),
                              Text('Diesel'),
                              Text('Fuel')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.speed_outlined, color: Colors.brown),
                              Text('__'),
                              Text('Mileage')
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.network_ping_rounded,
                                  color: Colors.brown),
                              Text('4461'),
                              Text('Engine')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.verified_user_outlined,
                                  color: Colors.brown),
                              Text('25/07/25'),
                              Text('Insurance')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.ad_units_sharp, color: Colors.brown),
                              Text('BL6'),
                              Text('Polution')
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Divider(),
                    )
                    // ... Other Card contents
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 400,
              child: Card(
                color: Colors.grey[350],
                margin:
                const EdgeInsets.only(left: 40, top: 30, bottom: 30, right: 40),
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: GridView.builder(
                    itemCount: 15,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            'Item $index',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),SizedBox(height: 300,width: double.infinity,child: MyTabbedCard(),)
          ],
        ),
      ),



      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: Colors.black,
        destinations: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide.none),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.all(Colors.teal[300]),
              ),
              onPressed: () {
                makePhoneCall('9744151527');
              },
              child: Text('Lets Talk'),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.all(Colors.grey[600]),
              ),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Book(),));
              },
              child: Text('Book Now'),
            ),
          ),
        ],
      ),
    );
  }
}
class MyTabbedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20,right: 35,top: 15,left: 35),
      child: Card(color: Colors.white,
        child: DefaultTabController(
          length: 3, // Number of tabs
          child: SizedBox(
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: 'Feature'),
                    Tab(text: 'Specifications'),
                    Tab(text: 'Overview'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Content for Tab 1
                      SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text('Central locking'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text('Driver air Bag'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text('Anti Lock Barking System'),
                                    ), Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text('Power door lock'),
                                    ), Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text('Adjustable seats'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text('Driver air Bag'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text('Crash sensor'),
                                    ), Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Text('Air Conditioner'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      // Content for Tab 2
                      Center(
                        child: Text('Content for Tab 2'),
                      ),
                      // Content for Tab 3
                      Center(
                        child: Text('Content for Tab 3'),
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
}
