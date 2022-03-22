import 'package:flutter/material.dart';
import 'package:apogee_leaders_app/viewmodels/map_viewmodel.dart';
import 'package:apogee_leaders_app/core/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:apogee_leaders_app/locator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_elevation/map_elevation.dart';
import 'package:apogee_leaders_app/model/data.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapViewModel>.reactive(
      viewModelBuilder: () => locator<MapViewModel>(),
      disposeViewModel: false,
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: colorWhite,
        body: Column(
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(25, 30, 50, 20),
                    child: Text(
                      "Apogee Leaders",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff2e2e2e),
                        ),
                      ),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(60, 30, 20, 20),
                    child: Image.asset('assets/menu.png',
                        width: 25,
                        height: 40,
                        alignment: Alignment.centerRight)),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.routeToHomeView();
              },
              style: ElevatedButton.styleFrom(
                primary: colorSkyBlue,
              ),
              child: Text(
                "Home",
                style: TextStyle(color: colorSlate),
              ),
            ),
            Container(
              height: 300,
              width: 300,
              margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: FlutterMap(
                options: new MapOptions(
                  center: LatLng(45.10, 5.48),
                  zoom: 11.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  PolylineLayerOptions(
                    polylines: [
                      Polyline(
                        points: getPoints(),
                        color: colorApricot,
                        strokeWidth: 3.0,
                      ),
                    ],
                  ),
                  MarkerLayerOptions(markers: [
                    if (viewModel.hoverPoint != null)
                      Marker(
                          point: viewModel.hoverPoint.latLng,
                          width: 8,
                          height: 8,
                          builder: (BuildContext context) => Container(
                                decoration: BoxDecoration(
                                    color: colorSkyBlue,
                                    borderRadius: BorderRadius.circular(8)),
                              ))
                  ]),
                ],
              ),
              foregroundDecoration: BoxDecoration(
                border: Border.all(
                  color: colorWhite,
                  width: 15,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            Container(
              height: 80,
              color: Colors.white.withOpacity(0.6),
              child: NotificationListener<ElevationHoverNotification>(
                child: Elevation(
                  getPoints(),
                  color: colorFog,
                  elevationGradientColors: ElevationGradientColors(
                    gt10: colorSage, gt20: colorMustard, gt30: colorApricot
                  ),
                )
              ),
            ),
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}
