import 'package:flutter/material.dart';


class Prof extends StatefulWidget {
  const Prof({super.key});

  @override
  State<Prof> createState() => _ProfState();
}

class _ProfState extends State<Prof> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Column(children: [
              Image(image: AssetImage('assets/images/profile.jpg'))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Desooza',
                                style: TextStyle(
                                  //  backgroundColor: Colors.orange[200],
                                    fontWeight: FontWeight.w700,
                                    color: Colors.teal[100],
                                    fontSize: 30),
                              ),IconButton(onPressed: () {

                              }, icon: Icon(Icons.edit,color: Colors.lightBlue[300],))
                            ],
                          ),
                          Text(
                            'Male',
                            style:
                            TextStyle(fontSize: 12, color: Colors.white60),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today_rounded,color: Colors.amber[100]),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text('Added on 26 januvery 2016',
                                  style: TextStyle(color: Colors.white70)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Icon(Icons.phone, color: Colors.green),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                '97743643765',
                                style: TextStyle(color: Colors.white70,fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Icon(Icons.email_outlined, color: Colors.blue),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                'desooza@gmail.com',
                                style: TextStyle(color: Colors.white70,fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38),
                        child: ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.navigate_next_rounded,
                              color: Colors.white70),
                          title: Text('Transaction You Made',
                              style: TextStyle(color: Colors.white60)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.navigate_next_rounded,
                              color: Colors.white70),
                          title: Text('Favorite Items',
                              style: TextStyle(color: Colors.white60)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2,top: 12,bottom: 12),
                        child: TextButton(onPressed: () {

                        }, child: Text('Help & Support',
                            style:
                            TextStyle(color: Colors.white70, fontSize: 19)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2,top: 4,bottom: 12),
                        child: TextButton(onPressed: () {

                        }, child: Text('FeedBack',
                            style:
                            TextStyle(color: Colors.white70, fontSize: 19)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(color: Colors.blue[100],
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: SizedBox(
                                    child: Text(
                                        'This website stores cookies on your computer. These cookies are used to collect information about how you interact with our website and allow us to remember you. We use this information in order to improve and customize your browsing experience and for analytics and metrics about our visitors both on this website '),
                                  ),
                                )
                              ],
                            )),
                      ),TextButton(onPressed: () {

                      }, child: Text('Contact Us',style: TextStyle(color: Colors.white70,fontSize: 19),))
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
