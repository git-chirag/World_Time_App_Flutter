import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time' : result['time'],
                      'location' : result['location'],
                      'flag' : result['flag'],
                      'isDayTime' : result['isDayTime']
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[200],
                ),
                label: Text('Edit Location', style: TextStyle(color: Colors.grey[200])),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 40, letterSpacing: 2.0, color: Colors.grey[200]),
                  ),
                ],
              ),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66, letterSpacing: 2, color: Colors.grey[200]),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
