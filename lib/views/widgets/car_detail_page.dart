import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:second_choice_flutter/model/product_model.dart';
import 'package:second_choice_flutter/views/widgets/booking_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/cart_controller.dart';


class ProductDetails extends StatefulWidget {
  ProductModel productModel;

  ProductDetails({super.key, required this.productModel});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  User? user = FirebaseAuth.instance.currentUser;
  final CartItemController _CartItemController = Get.put(CartItemController());
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
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.share))
            ],
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            centerTitle: true,
            title: const Text('Vehicle Detail')),
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
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.grey,
                          )
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                              "${widget.productModel.carimage![0]}"),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.productModel.carname}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.calendar_today_rounded,
                                    color: Colors.brown),
                                Text(
                                  "${widget.productModel.modelyear}",
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.speed_rounded,
                                    color: Colors.brown),
                                Text(
                                  "${widget.productModel.kms}",
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.info_outline_rounded,
                                    color: Colors.brown),
                                Text(
                                  "${widget.productModel.fuel}",
                                )
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
                                  const Icon(Icons.currency_rupee),
                                  Text(
                                    "${widget.productModel.prize}",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            const Icon(Icons.favorite_border)
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(13.0),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.calendar_month,
                                    color: Colors.brown),
                                Text(
                                  "${widget.productModel.modelyear}",
                                ),
                                const Text('Year')
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.imagesearch_roller,
                                    color: Colors.brown),
                                Text(
                                  "${widget.productModel.color}",
                                ),
                                const Text('Color')
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.speed_outlined,
                                    color: Colors.brown),
                                Text(
                                  "${widget.productModel.kms}",
                                ),
                                const Text('Kms')
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.person_2_outlined,
                                    color: Colors.brown),
                                Text(
                                  "${widget.productModel.owner}",
                                ),
                                const Text('Owner')
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.directions_car_outlined,
                                    color: Colors.brown),
                                Text(
                                  "${widget.productModel.fuel}",
                                ),
                                const Text('Fuel')
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.speed_outlined,
                                    color: Colors.brown),
                                Text(
                                  "${widget.productModel.milage}",
                                ),
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
                                Text(
                                  "${widget.productModel.engine}",
                                ),
                                Text('Engine')
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.verified_user_outlined,
                                    color: Colors.brown),
                                Text(
                                  "${widget.productModel.insure}",
                                ),
                                Text('Insurance')
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.ad_units_sharp, color: Colors.brown),
                                Text(
                                  "${widget.productModel.polution}",
                                ),
                                Text('Polution')
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Divider(),
                      )
                      // ... Other Card contents
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Card(
                  color: Colors.grey[350],
                  margin: const EdgeInsets.only(
                      left: 40, top: 30, bottom: 30, right: 40),
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: GridView.builder(
                      itemCount: widget.productModel.carimage?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GridTile(
                            child: Image.network(
                          "${widget.productModel.carimage![index]}",
                          fit: BoxFit.cover,
                        ));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Card(
                  color: Colors.grey[350],
                  margin: const EdgeInsets.only(
                      left: 40, top: 30, bottom: 30, right: 40),
                  child: DefaultTabController(
                      length: 3,
                      child: SizedBox(
                        child: Column(children: [
                          const TabBar(
                            labelColor: Colors.black,
                            tabs: [
                              Tab(text: 'Feature'),
                              Tab(text: 'Specifications'),
                              Tab(text: 'Overview'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(children: [
                              ListView.builder(
                                itemCount: widget.productModel.features?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${widget.productModel.features![index]}",
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                itemCount:
                                    widget.productModel.specification?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${widget.productModel.specification![index]}",
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                itemCount: widget.productModel.overview?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${widget.productModel.overview![index]}",
                                    ),
                                  );
                                },
                              ),
                            ]),
                          )
                        ]),
                      )),
                ),
              )
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
                child: const Text('Lets Talk'),
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
                onPressed: () async {
                  // await _CartItemController
                  //     .checkProductExistence(
                  //     uId: user!.uid,
                  //     productModel: widget.productModel);
                 //

                  Get.to(
                          () => Book(productModel: widget.productModel));
                },
                child: const Text('Book Now'),
              ),
            ),
          ],
        ));
  }
}
