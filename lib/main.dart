import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_with_markers/places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  List<Marker> allMarkers = [];

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  static const _initialCameraPosition = CameraPosition(
      target: LatLng(11.0168, 76.9558),
      zoom: 11.0);

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    placesOfInterest.forEach((element) {
      allMarkers.add(Marker(
        markerId: MarkerId(element.name),
        draggable: false,
        position: element.coordinates,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120.0,
                      width: 105.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(element.thumbnail),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 3.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 8.0),
                          Text(
                            element.name,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LibreBold'),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            element.designation,
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Comforta'),
                          ),
                          SizedBox(height: 3.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                element.rating,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Comforta'),
                              ),
                            ],
                          ),
                          SizedBox(height: 7.0),
                          Divider(thickness: 1.0, height: 1.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  foregroundImage: NetworkImage(
                                      'https://e7.pngegg.com/pngimages/915/706/png-clipart-blue-call-icon-dialer-android-google-play-telephone-phone-blue-text.png'),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  foregroundImage: NetworkImage(
                                      'https://news.wirefly.com/sites/phonedog.com/files/styles/blog_entry/public/android-messages-icon.jpg?itok=pVmsm2T3'),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  foregroundImage: NetworkImage(
                                      'https://w7.pngwing.com/pngs/672/164/png-transparent-whatsapp-icon-whatsapp-logo-computer-icons-zubees-halal-foods-whatsapp-text-circle-unified-payments-interface-thumbnail.png'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            element.coordinates,
          );
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Employee Locations'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              onTap: (position) {
                _customInfoWindowController.hideInfoWindow!();
              },
              onCameraMove: (position) {
                _customInfoWindowController.onCameraMove!();
              },
              onMapCreated: (GoogleMapController controller) async {
                _customInfoWindowController.googleMapController = controller;
              },
              initialCameraPosition: _initialCameraPosition,
              markers: Set.from(allMarkers),
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 135,
            width: 300,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
