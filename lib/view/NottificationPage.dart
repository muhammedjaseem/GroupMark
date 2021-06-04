import 'package:flutter/material.dart';

class nottification extends StatefulWidget {
  /*const nottification({Key key}) : super(key: key);*/

  @override
  _nottificationState createState() => _nottificationState();
}

class _nottificationState extends State<nottification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.only(left: 60, top: 6),
        child: Text("Notifications"),
      ),
      backgroundColor: Colors.indigo.shade400,),

      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 3,top: 8),
            child: Text("Yesterday",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
          ),



          SizedBox(
            height: 7,
          ),
          Container(

              margin: EdgeInsets.all(10),
              height: 70,
            width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),

                color: Colors.white24,

                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ), //Offset
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],

              ),

            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  SizedBox(height: 9,),

                  Text('Eid Mubarak', style: TextStyle(fontSize: 20),),

                  SizedBox(height: 6,),

                  Text('2022-05-01', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),



                ],

              ),
            ),

             ),







        ],
      ),
    );
  }
}
