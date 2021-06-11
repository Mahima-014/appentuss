import 'dart:convert';

import 'package:appentus_task/models/APIModel.dart';
import 'package:http/http.dart' as http;

class Controller
{
  //API
  Future<List<APIModel>> getData() async
  {
    List<APIModel> apiModelList = [];
    String url  = 'https://picsum.photos/v2/list';
      var response = await http.get(Uri.parse(url));
      if(response.statusCode==200)
        {
          var jsonData = jsonDecode(response.body);
          jsonData.forEach((data){
            apiModelList.add(
              APIModel.fromJson(data)
            );
          });
        }
      else{
        print('Status code ${response.statusCode}');
      }
      return apiModelList;
  }
}