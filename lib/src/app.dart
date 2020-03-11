import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return  MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text('Flutter Scaffold -- Lets see some images'),
        ),
        // Add cut out Scaffold
      )
    );
  }
}





      // body: Center(
      //   child: Text("This is Homepage",
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 40.0,
      //       fontStyle: FontStyle.italic,
      //     ),
      //   ),
      // ),
//       drawer: Drawer(
//         elevation: 16.0,
//         child: Column(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text("xyz"),
//               accountEmail: Text("xyz@gmail.com"),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Text("xyz"),
//               ),
//               otherAccountsPictures: <Widget>[
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   child: Text("abc"),
//                 )
//               ],
//             ),
//             ListTile(
//               title: new Text("All Inboxes"),
//               leading: new Icon(Icons.mail),
//             ),
//             Divider(
//               height: 0.1,
//             ),
//             ListTile(
//               title: new Text("Primary"),
//               leading: new Icon(Icons.inbox),
//             ),
//             ListTile(
//               title: new Text("Social"),
//               leading: new Icon(Icons.people),
//             ),
//             ListTile(
//               title: new Text("Promotions"),
//               leading: new Icon(Icons.local_offer),
//             )
//           ],
//         ),
//       ),
//       persistentFooterButtons: <Widget>[
//         RaisedButton(
//           elevation: 10.0,
//           onPressed: () {
//             print('Add button clicked');
//           },
//           color: Colors.green,
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//         ),
//         RaisedButton(
//           elevation: 10.0,
//           onPressed: () {
//             print('Clear button clicked');
//           },
//           color: Colors.blueGrey,
//           child: Icon(
//             Icons.clear,
//             color: Colors.white,
//           ),
//         ),
//       ],
//       bottomNavigationBar: BottomNavigationBar(
//       currentIndex: 0,
//       fixedColor: Colors.teal,
//       items: [
//         BottomNavigationBarItem(
//           title: Text("Home"),
//           icon: Icon(Icons.home),
//         ),
//         BottomNavigationBarItem(
//           title: Text("Search"),
//           icon: Icon(Icons.search),
//         ),
//         BottomNavigationBarItem(
//           title: Text("Add"),
//           icon: Icon(Icons.add_box),
//         ),
//       ],
//       // onTap: (int index){
//       //   setState(() {
//       //     currentIndex = index;
//       //   });
//       // },
//       ),