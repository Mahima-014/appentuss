import 'dart:io';

import 'package:appentus_task/controller/controller.dart';
import 'package:appentus_task/models/APIModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  int height;
  int width;
  Future<List<APIModel>> listOfData;
  Controller con = Controller();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listOfData = con.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),

      // future builder and grid view to display the data fetching from api.
      body: FutureBuilder<List<APIModel>>(
        future: listOfData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StaggeredGridView.countBuilder(
                itemCount: snapshot.data.length,
                crossAxisCount: 2,
                itemBuilder: (context, index) {
                  height = snapshot.data[index].height;
                  width =snapshot.data[index].width;
                  return Card(
                      child: Column(
                        children: [
                          Container(
                            // child: Image.network('${snapshot.data[index].downloadUrl}')
                            child: CachedNetworkImage(
                              imageUrl: '${snapshot.data[index].downloadUrl}',
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  CircularProgressIndicator(value: downloadProgress.progress),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Author Name : ${snapshot.data[index].author}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    elevation: 5,
                  );
                },
                staggeredTileBuilder: (index) =>StaggeredTile.fit(1),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error"));
          }
          return Center(child:CircularProgressIndicator());
        },
      ),
    );
  }


}
