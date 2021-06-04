import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:markgroup/models/HolidaModelClass.dart';
import 'package:shared_preferences/shared_preferences.dart';
class hollyday extends StatefulWidget {
  @override
  _hollydayState createState() => _hollydayState();
}
class _hollydayState extends State<hollyday> {
   String token="";
  Future<Holidaymodel> getData() async {
     final prefs = await SharedPreferences.getInstance();
     token = prefs.getString('token');
    var url = Uri.parse(
        "http://markbuilders.in/admin/public/api/admin_view_holiday");
    var response = await http.get(url,
        headers: { 'Authorization': 'Bearer $token',});
    if (response.statusCode == 200) {
    //  print(response.body);
      print("Success..........");
      return Holidaymodel.fromJson(jsonDecode(response.body));
    }
    else {
      return null;
      print("error");
    }
   // return "null";
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50, top: 6),
          child: Text("Holiday Calender"),
        ),
        backgroundColor: Colors.indigo.shade400,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot)
        {
          List<Datum> ListData =snapshot.data.data;

          return ListView.builder(
            itemCount: ListData.length,
              itemBuilder: (context,index)
          {
            return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17), //border corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: 5, //spread radius
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(ListData[index].date.day.toString()+ '\n'
                              + ListData[index].date.weekday.toString(),
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    VerticalDivider(
                      thickness: 2,
                      color: Colors.black26,
                      indent: 17,
                      endIndent: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ListData[index].title.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            ListData[index].date.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          });
        },
      ),
      // body: ListView(
      //   children: [
      //     SizedBox(
      //       height: 5,
      //     ),
      //
      //
      //
      //
      //
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*Navigator.push(context, MaterialPageRoute(builder: (context)=>hollyday()));*/
        },
        child: const Icon(
          Icons.add_outlined,
          size: 30,
        ),
        backgroundColor: Colors.indigo.shade400,
      ),
    );
  }
}
