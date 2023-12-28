
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class NavigationBars extends StatefulWidget {

  NavigationBars({super.key,});

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
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
    return NavigationBar(
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

            },
            child: Text('Book Now'),
          ),
        ),
      ],
    );
  }
}
