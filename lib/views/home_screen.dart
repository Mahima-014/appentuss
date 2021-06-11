import 'package:appentus_task/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CameraPosition cameraPosition;
  LatLng latitudeLongitude;
  Set<Marker> marker = {};
  GoogleMapController controller;
  Location location = Location();
  LocationData currentLocation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 10.0);
    getCurrentLocationData();
  }

  //function to get current location.
  void getCurrentLocationData() async {
    currentLocation = await location.getLocation();
    setState(() {
      cameraPosition = CameraPosition(target: LatLng(currentLocation.latitude, currentLocation.longitude), zoom: 15.0);
      if (controller != null)
        controller
            .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      marker.add(Marker(
        markerId: MarkerId("Marker_1"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
      ));
    });
  }



  //function to create map.
  void _onMapCreated(GoogleMapController _cntlr) {
    controller = _cntlr;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Constants.appBar('Home'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            //google map widget.
            GoogleMap(
              initialCameraPosition: cameraPosition,
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: marker,
            ),
            //button for navigation to screen second.
            Container(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.only(top:10,left: 30,right: 30,bottom: 10),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )
                ),
                onPressed:(){
                  print("Login In");
                  // if (_formKey.currentState.validate()) {
                  //   // If the form is valid, display a Snackbar.
                  //   ScaffoldMessenger.of(context)
                  //       .showSnackBar(SnackBar(content: Text('Processing Data')));
                  // }
                  Navigator.pushNamed(context, Constants.secondScreenRoute);

                },
                child: Text(
                  'Second Screen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

