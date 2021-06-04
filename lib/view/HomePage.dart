import 'package:flutter/material.dart';
import 'package:markgroup/view/Hollyday_page.dart';
import 'package:markgroup/view/NottificationPage.dart';

class home extends StatefulWidget {
  /*const home({Key key}) : super(key: key);*/

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>nottification()));
            },
            icon: Icon(Icons.notifications, size: 25, color: Colors.white,),
          )
        ],
        backgroundColor: Colors.indigo[300],
      ),


      drawer: Drawer(

        child: Container(

          child: ListView(
            children: [


              Container(
                height: 230,
                child: ListTile(
                  title: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset("images/pic.jpg", fit: BoxFit.fill),
                    ),
                    backgroundColor: Colors.transparent,
                    radius: 70,
                  ),
                  subtitle: Center(child: Column(
                    children: [
                      Text("prageen",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(height: 5,),
                      Text("Supervisor civil",style: TextStyle(fontSize: 17,color: Colors.white70),),
                    ],
                  )),
                  tileColor: Colors.indigo.shade300,

                ),
              ),

              ListTile(
                leading: Icon(Icons.people_rounded,size: 20,color: Colors.blue,),
                title: Text("Attendence",style: TextStyle(fontSize: 15),),


              ),
              ListTile(
                leading: Icon(Icons.money,size: 20,color: Colors.green,),
                title: Text("Daily Expanse",style: TextStyle(fontSize: 15),),


              ),


              ListTile(
                leading: Icon(Icons.request_page,size: 20,color: Colors.brown,),
                title: Text("Material Request",style: TextStyle(fontSize: 15),),


              ),


              ListTile(
                leading: Icon(Icons.leave_bags_at_home,size: 20,color: Colors.deepOrangeAccent,),
                title:  Text("Apply Leave",style: TextStyle(fontSize: 15),),


              ),
              GestureDetector(
                onTap: (){
                 /* Navigator.push(context, MaterialPageRoute(builder: (context)=>hollyday()));*/
                },
                child: ListTile(
                  leading: Icon(Icons.calendar_today,size: 20,color: Colors.yellow.shade700,),
                  title: Text("Holiday Calender",style: TextStyle(fontSize: 15),),


                ),
              ),
              ListTile(
                leading: Icon(Icons.bookmark_border,size: 20,color: Colors.blueAccent,),
                title: Text("Purchase Order",style: TextStyle(fontSize: 15),),


              ),
              ListTile(
                leading: Icon(Icons.logout,size: 20,color: Colors.black54,),
                title: Text("Logout",style: TextStyle(fontSize: 15),),


              ),


            ],
          ),

        ),

      ),


      body: SafeArea(
        child: Stack(
          children: [
            Positioned(

                child: Container(

                  height: 315,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Colors.indigo[300]),

                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.asset("images/pic.jpg", fit: BoxFit.fill),
                          ),
                          backgroundColor: Colors.transparent,
                          radius: 70,
                        ),
                        SizedBox(height: 5,),
                        Text("prageen",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                        SizedBox(height: 5,),
                        Text("Supervisor civil",style: TextStyle(fontSize: 17,color: Colors.white70),),

                      ],
                    ),
                  ),

                )),

          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>hollyday()));
        },
        child: const Icon(Icons.add_outlined,size: 30,),
        backgroundColor: Colors.indigo.shade300,
      ),




    );
  }
}
