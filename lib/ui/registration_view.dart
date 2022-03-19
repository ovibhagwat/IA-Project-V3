import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:skyline_template_app/viewmodels/registration_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<RegistrationViewModel>(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: colorWhite,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 180.0,
              ),
              Container(
                child: Image.asset('assets/ApogeeLogo.png'),
                width: 320,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 0.0, 50.0, 0.0),
                  child: Text(
                    "Leaders",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: colorSlate,
                      ),
                    ),
                  )),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: colorSlate),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorSlate, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  textAlign: TextAlign.left,
                  obscureText: true,
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your password.',
                    hintStyle: TextStyle(color: colorSlate),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorSlate, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
                child: Material(
                  color: colorNavy,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      //Implement login functionality.
                    },
                    minWidth: 320.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                    ),
                  ),
                ),
              ),
              Container(
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: colorSlate,
                    ),
                    padding: EdgeInsets.all(50),
                    onPressed: () => viewModel.routeToHomeView()),
                alignment: Alignment.topRight,

              ),
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
