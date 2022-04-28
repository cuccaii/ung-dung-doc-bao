import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/screens/details/topheadline_details.dart';
import 'package:flutter_newspaper_reading_app/services/api/topheadline_news/topheadline_controller.dart';
import 'package:get/get.dart';

class TopHeadlineView extends StatefulWidget {
  const TopHeadlineView({Key? key}) : super(key: key);

  @override
  State<TopHeadlineView> createState() => _TopHeadlineViewState();
}

class _TopHeadlineViewState extends State<TopHeadlineView> {
  final topHeadlineController = Get.put(TopHeadlineController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => topHeadlineController.isLoading.value
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: ListView.builder(
                  itemCount: topHeadlineController.headlineList.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => TopHeadlineDetails(), arguments: {
                          'Title': topHeadlineController
                              .headlineList[index].title
                              .toString(),
                          'Image': topHeadlineController
                              .headlineList[index].urlToImage
                              .toString(),
                          'Id': topHeadlineController
                              .headlineList[index].source!.id
                              .toString(),
                          'Name': topHeadlineController
                              .headlineList[index].source!.name
                              .toString(),
                          'Content': topHeadlineController
                              .headlineList[index].content
                              .toString(),
                          'Url': topHeadlineController.headlineList[index].url
                              .toString(),
                          'PublishedAt': topHeadlineController
                              .headlineList[index].publishedAt
                              .toString(),
                          'Author': topHeadlineController
                              .headlineList[index].author
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
                            Image.network(topHeadlineController
                                .headlineList[index].urlToImage
                                .toString()),
                            Text(
                              topHeadlineController.headlineList[index].title
                                  .toString(),
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              topHeadlineController
                                  .headlineList[index].description
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
