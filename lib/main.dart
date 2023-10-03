import 'package:flutter/material.dart';
import 'package:openstreetmap/FlutterLocationPicker.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
    body:
    FlutterLocationPicker(
    initZoom: 13,
    minZoomLevel: 5,
    maxZoomLevel: 16,
    trackMyPosition: false,
    searchBarBackgroundColor: Colors.white,
    mapLanguage: 'En',
    onError: (e) =>  showToast(context,e),
    onPicked: (pickedData) {
      showToast(context,"latitude:"+pickedData.latLong.latitude.toString());
    showToast(context,"longitude:"+pickedData.latLong.longitude.toString());
    //showToast(context,pickedData.address);
    //print(pickedData.addressData.country);
    }),

    );

  }

}

void showToast(BuildContext context,var message) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.fixed,
      content:
      Container(
          height: 20,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message,textDirection: TextDirection.rtl,)
            ],
          )
      )
  )
  );
}
