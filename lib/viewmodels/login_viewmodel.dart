import 'package:apogee_leaders_app/viewmodels/base_viewmodel.dart';
import 'package:apogee_leaders_app/core/enums/view_state.dart';
import 'package:apogee_leaders_app/locator.dart';
import 'package:apogee_leaders_app/core/services/navigation_service.dart';
import 'package:apogee_leaders_app/core/utilities/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebaseAuth = FirebaseAuth.instance;
  String _email;
  String get email => _email;
  String _password;
  String get password => _password;

  Future init() async {
    print("Login ViewModel init()");
    setState(ViewState.Busy);
    try {
      print('try login statement');
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);

  }

  void loginUser() {
    try{
      _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password);
    }catch(e){
      print("Failed to Login User: $e");
    }
    routeToHomeView();
  }

  void setEmailAddress(String inputString) {
    _email = inputString;
  }

  void setPassword(String inputString) {
    _password = inputString;
  }

  void routeToHomeView() {
    _navigationService.navigateTo(HomeViewRoute);
  }

  void routeToRegistrationView() {
    _navigationService.navigateTo(RegistrationViewRoute);
  }

}
