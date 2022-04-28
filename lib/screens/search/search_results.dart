import 'package:flutter/material.dart';
import 'package:flutter_newspaper_reading_app/services/api/search/search_controller.dart';
import 'package:get/get.dart';

class SearchResults extends StatelessWidget {
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Article Search Results',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Color(0xff34e2eb),
      ),
      body: Obx(() => searchController.isLoading.value
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: ListView.builder(
                  itemCount: searchController.searchList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Image.network(searchController
                              .searchList[index].urlToImage
                              .toString()),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text(
                              searchController.searchList[index].title
                                  .toString(),
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text(
                              searchController.searchList[index].description
                                  .toString(),
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )),
    );
  }
}
