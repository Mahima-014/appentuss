import 'dart:convert';

import 'package:appentus_task/models/APIModel.dart';
import 'package:appentus_task/models/UserModel.dart';
import 'package:appentus_task/utilities/db_helper.dart';
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


  Future<Map> login(UserModel user) async
  {

    List<Map> list = await checkLogin(user.email, user.password);
    if(list.isEmpty)
    {
      return null;
    }
    else
      return list[0];
  }


  Future<int> saveDataInDB(UserModel user) async
  {
    DbManager db = DbManager();
    db.createTableIfNotExists("user", "CREATE TABLE user(id INTEGER PRIMARY KEY, "
        "name varchar, "
        "email varchar, "
        "password varchar, "
        "number varchar, "
        "image varchar "
        ")");

    List<Map> list = await getDataList("email",user.email);
    if(list.isEmpty)
    {
      db.insert("user", user.toJson());
      return 1;
    }
    else
      return 0;

  }

  Future<List<Map>> getDataList(String fieldName, String value) async {
    DbManager db = DbManager();
    List<Map> list = await db.getRecords("SELECT * FROM user WHERE $fieldName = '$value'");
    return list==null? []: list;
  }

  Future<List<Map>> checkLogin(String email, String password) async {
    DbManager db = DbManager();
    List<Map> list = await db
        .getRecords("SELECT * FROM user WHERE email='$email' AND password='$password'");
    return list==null? []: list;
  }
}
