import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'constants.dart';
import 'model.dart';

class ecommerceApi extends StatefulWidget {
  const ecommerceApi({Key? key}) : super(key: key);

  @override
  State<ecommerceApi> createState() => _ecommerceApiState();
}

class _ecommerceApiState extends State<ecommerceApi> {
  List<SamplePosts> samplePosts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: app_Bar("Movies FLix"),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(

                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CustomScrollView(
                        semanticChildCount: 5,
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(),
                            sliver: SliverGrid(
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 15,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                  childCount: samplePosts.length,
                                      (context, index) {
                                    return productCard(
                                        category: samplePosts[index].category,
                                        imageUrl: samplePosts[index].image,
                                        price: samplePosts[index].price,
                                        productTitle: samplePosts[index].title);
                                  }),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<SamplePosts>> getData() async {
    final response = await http.get(
      Uri.parse(
        'https://api.tvmaze.com/search/shows?q=all',
      ),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePosts.add(SamplePosts.fromJson(index));
      }
      return samplePosts;
    } else {
      return samplePosts;
    }
  }
}
