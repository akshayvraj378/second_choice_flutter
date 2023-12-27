import 'package:flutter/material.dart';

import '../../model/home_model.dart';

class MyTabbedCard extends StatelessWidget {
  late Loginmodel productModel;

  @override
Widget build(BuildContext context) {
  return  Padding(
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
                                  ListView.builder(

                                    itemCount: productModel.carname?.length
                                    ,itemBuilder: (context, index) {
                                    return Padding(padding: EdgeInsets.all(6),
                                      child: Text(  "${productModel.carname}",),

                                    );
                                  },)














                                //   Padding(
                                //     padding: EdgeInsets.all(6.0),
                                //     child: Text('Central locking'),
                                //   ),
                                //   Padding(
                                //     padding: EdgeInsets.all(6.0),
                                //     child: Text('Driver air Bag'),
                                //   ),
                                //   Padding(
                                //     padding: EdgeInsets.all(6.0),
                                //     child: Text('Anti Lock Barking System'),
                                //   ), Padding(
                                //     padding: EdgeInsets.all(6.0),
                                //     child: Text('Power door lock'),
                                //   ), Padding(
                                //     padding: EdgeInsets.all(6.0),
                                //     child: Text('Adjustable seats'),
                                //   ),
                                //   Padding(
                                //     padding: EdgeInsets.all(6.0),
                                //     child: Text('Driver air Bag'),
                                //   ),
                                //   Padding(
                                //     padding: EdgeInsets.all(6.0),
                                //     child: Text('Crash sensor'),
                                //   ), Padding(
                                //     padding: EdgeInsets.all(6.0),
                                //     child: Text('Air Conditioner'),
                                //   ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    // Content for Tab 2
                    Center(
                      child: Text('Content for  2'),
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
