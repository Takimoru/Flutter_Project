import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        flexibleSpace: SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75.0,
            color: Colors.white70,
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: Container(
          color: Colors.lightGreen.shade100,
          height: 75.0,
          width: double.infinity,
          child: Center(
            child: Text('Bottom'),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text('Row1'),
                Padding(padding: EdgeInsets.all(16.0),),
                Text('Row2'),
                Padding(padding: EdgeInsets.all(16.0),),
                Text('Row3'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100.0),
          bottomRight: Radius.circular(10.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.lightGreen.shade500,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'Flutter World',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.deepPurple,
              decoration: TextDecoration.underline,
              decorationColor: Colors.deepPurpleAccent,
              decorationStyle: TextDecorationStyle.dotted,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' for ',
              ),
              TextSpan(
                text: 'Mobile',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}