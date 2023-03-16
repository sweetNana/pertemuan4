import 'package:flutter/material.dart';

import 'halaman_detail.dart';
import 'tourism_place.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
      ),
      body: ListView.builder(
        itemCount: tourismPlaceList.length,
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HalamanDetail(place: place,),),
              );
            },
            child: Card(
              child: Row(
                children: [
                  // gambar
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.network(place.imageUrls[0]),
                  ),
                  // text
                  Text(place.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
