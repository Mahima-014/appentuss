import 'package:appentus_task/controller/controller.dart';
import 'package:appentus_task/models/APIModel.dart';
import 'package:flutter/material.dart';

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
            return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  height = snapshot.data[index].height;
                  width =snapshot.data[index].width;
                  return Text("${snapshot.data[index].author}");
                }
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
