import 'package:flutter/material.dart';
import 'package:skyline_template_app/viewmodels/recipe_viewmodel.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeViewModel>.reactive(
      viewModelBuilder: () => locator<RecipeViewModel>(),
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
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                'Recipe View',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xff2e2e2e),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 150,
                      child: TextField(),
                    ),
                    Container(
                      width: 150,
                      child: TextField(),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      width: 150,
                      child: TextField(),
                    ),
                    Container(
                      width: 150,
                      child: TextField(),
                    ),
                  ],
                ),
              ],
            ),
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}
