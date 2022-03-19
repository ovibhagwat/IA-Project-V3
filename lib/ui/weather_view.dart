import 'package:flutter/material.dart';
import 'package:skyline_template_app/viewmodels/weather_viewmodel.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:google_fonts/google_fonts.dart';


class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WeatherViewModel>.reactive(
      viewModelBuilder: () => locator<WeatherViewModel>(),
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
                      style:
                      GoogleFonts.montserrat(
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
            Container(padding: const EdgeInsets.fromLTRB(25, 50, 50, 20),
                child: Text(
                  "Weather View",
                  style:
                  GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xff2e2e2e),
                    ),
                  ),
                )),
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}
