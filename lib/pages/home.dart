import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;
    String img= data['isDay'] ? 'day.jpg' : 'night.jpg';
    Color textC= data['isDay'] ? Colors.black : Colors.white;
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('images/$img'),
            fit: BoxFit.cover,
          )

        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,140.0,0,0),
          child: SafeArea(
              child:Column(
                children: [
                  FlatButton.icon(
                    onPressed: () async{
                      dynamic result=await Navigator.pushNamed(context,'/location');
                      setState(() {
                        data['location']=result['location'];
                        data['time']=result['time'];
                        data['isDay']=result['isDay'];
                        data['flag']=result['flag'];
                      });

                      },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.red,
                    ),
                    label: Text('Edit Location',
                        style:TextStyle(
                          color: textC,
                        )
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                            color: textC,
                            fontSize: 28.0,
                            letterSpacing: 2.0
                      ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(data['time'],
                    style: TextStyle(
                      color: textC,
                      fontSize: 66.0,
                    ),
                  )
                ],
              )
          ),
        ),
      )
    );
  }
}
