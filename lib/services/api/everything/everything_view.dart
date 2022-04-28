import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/services/api/everything/everything_controller.dart';
import 'package:get/get.dart';

import '../../../screens/details/detailscreen.dart';

class EveryThingView extends StatefulWidget {
  const EveryThingView({Key? key}) : super(key: key);

  @override
  State<EveryThingView> createState() => _EveryThingViewState();
}

class _EveryThingViewState extends State<EveryThingView> {
  final everythingController = Get.put(EverythingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => everythingController.isLoading.value
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: ListView.builder(
                  itemCount: everythingController.newsList.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => DetailScreen(), arguments: {
                          'Title': everythingController.newsList[index].title
                              .toString(),
                          'Image': everythingController
                              .newsList[index].urlToImage
                              .toString(),
                          'Id': everythingController.newsList[index].source!.id
                              .toString(),
                          'Name': everythingController
                              .newsList[index].source!.name
                              .toString(),
                          'Content': everythingController
                              .newsList[index].content
                              .toString(),
                          'Url': everythingController.newsList[index].url
                              .toString(),
                          'PublishedAt': everythingController
                              .newsList[index].publishedAt
                              .toString(),
                          'Author': everythingController.newsList[index].author
                              .toString(),
                        });
                      },
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            Image.network(everythingController
                                .newsList[index].urlToImage
                                .toString()),
                            Text(
                              everythingController.newsList[index].title
                                  .toString(),
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              everythingController.newsList[index].description
                                  .toString(),
                              style: TextStyle(fontSize: 15),
                              maxLines: 3,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    ));
  }
}
