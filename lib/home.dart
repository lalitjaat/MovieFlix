import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieflix/constants.dart';
import 'dart:convert';

import 'model.dart';

class ecommerceApi extends StatefulWidget {
  const ecommerceApi({Key? key}) : super(key: key);

  @override
  State<ecommerceApi> createState() => _ecommerceApiState();
}

class _ecommerceApiState extends State<ecommerceApi> {
  List<SamplePosts> samplePosts = [];


void initState() {
  getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: app_Bar("Movies FLix"),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child:
                   Container(
             
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding:
                    const EdgeInsets.symmetric(),
                    sliver: SliverGrid(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                          childAspectRatio:1
                      ),
                      delegate: SliverChildBuilderDelegate(childCount: samplePosts.length,
                              (BuildContext context, int index) {
                            return  productCard(
                            category: samplePosts[index].category,
                            imageUrl: samplePosts[index].image,
                            price: samplePosts[index].price,
                            productTitle: samplePosts[index].title);
                          }),
                    ),
                  )
                ],
              ),
            )




                  
                ),
                
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
      List<SamplePosts> samplePosts = [];

    final response = await http.get(
      Uri.parse(
        'https://api.tvmaze.com/search/shows?q=all',
      ),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {

        samplePosts.add(SamplePosts.fromJson(index));
                print(samplePosts[0].image);

      }
      return samplePosts;
    } else {
      return samplePosts;
    }
  }
}
