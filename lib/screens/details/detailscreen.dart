import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff34e2eb),
          title: Text(Get.arguments['Title']),
        ),
        body: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                Get.arguments['Image'].toString(),
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0x6634e2eb),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          Get.arguments['Id'].toString() +
                              ',  ' +
                              Get.arguments['Name'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      width: 100,
                      height: 30,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  Get.arguments['Title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  Get.arguments['Content'],
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  Get.arguments['Url'].toString(),
                  style: TextStyle(color: Colors.blue, fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      Get.arguments['PublishedAt'].toString(),
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      Get.arguments['Author'].toString(),
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
