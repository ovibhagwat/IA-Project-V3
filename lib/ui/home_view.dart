import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apogee_leaders_app/core/utilities/constants.dart';
import 'package:apogee_leaders_app/viewmodels/home_viewmodel.dart';
import 'package:apogee_leaders_app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: colorWhite,
        body: Column(
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(25, 30, 50, 0),
                    child: Text(
                      "Apogee Leaders ",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff2e2e2e),
                        ),
                      ),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(60, 30, 20, 0),
                    child: Image.asset('assets/menu.png',
                        width: 25,
                        height: 40,
                        alignment: Alignment.centerRight)),
              ],
            ),
            Container(
              width: 360,
              height: 700,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(0, 25, 60, 25),
                    decoration: const BoxDecoration(color: colorWhite),
                    child: Text(
                      'Weather',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff2e2e2e),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.routeToWeatherView();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: colorSkyBlue, fixedSize: const Size(350, 80)),
                    child: Text(
                      "Weather View",
                      style: TextStyle(color: colorSlate),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(0, 25, 60, 25),
                    decoration: const BoxDecoration(color: colorWhite),
                    child: Text(
                      'Maps',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff2e2e2e),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.routeToMapView();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: colorSkyBlue, fixedSize: const Size(350, 80)),
                    child: Text(
                      "Map View",
                      style: TextStyle(color: colorSlate),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(0, 25, 60, 25),
                    decoration: const BoxDecoration(color: colorWhite),
                    child: Text(
                      'Recipes',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff2e2e2e),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.routeToRecipeView();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: colorSkyBlue, fixedSize: const Size(350, 80)),
                    child: Text(
                      "Recipe View",
                      style: TextStyle(color: colorSlate),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.routeToLoginView();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(40, 20),
                      primary: colorNavy,
                    ),
                    child: Text(
                      "Log Out",
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
