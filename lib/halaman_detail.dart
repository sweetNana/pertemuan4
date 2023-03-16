import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'tourism_place.dart';

class HalamanDetail extends StatelessWidget {
  final TourismPlace place;
  const HalamanDetail({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(place.name),
      ),
      body: ListView(
        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.network(place.imageUrls[0]),
                Image.network(place.imageUrls[1]),
                Image.network(place.imageUrls[2]),
              ],
            ),
          ),
          Text(place.location),
          Text(place.openDays),
          Text(place.openTime),
          Text(place.description),
          ElevatedButton(onPressed: (){
            _launchUrl('https://spada.upnyk.ac.id/');
          }, child: Text('Spada'),),
        ],
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

}
