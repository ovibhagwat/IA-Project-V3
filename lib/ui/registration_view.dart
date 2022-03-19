import 'package:flutter/material.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:skyline_template_app/viewmodels/registration_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:skyline_template_app/locator.dart';

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
              Container(child: IconButton(icon: Icon(Icons.arrow_back,color: colorSlate,), onPressed: ()=> viewModel.routeToHomeView()),alignment: Alignment.topLeft,),
              SizedBox(
                height: 100.0,
              ),
              Container(child: Image.asset('assets/ApogeeLogo2.png'),),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Center(child: Text("Apogee Leaders Registration",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: colorSlate),)),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    viewModel.setEmailAddress(value);
                  },
                  decoration: InputDecoration(filled: true,fillColor: colorSlate,
                    hintText: 'Enter your email',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: colorSkyBlue, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: colorSkyBlue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
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
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    viewModel.setPassword(value);
                  },
                  decoration: InputDecoration(filled: true,fillColor: colorSlate, focusColor: colorWhite,
                    hintText: 'Enter your password.',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: colorSkyBlue, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: colorSkyBlue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
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
                  color: colorSkyBlue,
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      print(viewModel.email);
                      print(viewModel.password);
                    },
                    minWidth: 330.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                    ),
                  ),
                ),
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
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
