import 'package:apogee_leaders_app/viewmodels/base_viewmodel.dart';
import 'package:apogee_leaders_app/locator.dart';
import 'package:apogee_leaders_app/core/services/navigation_service.dart';
import 'package:apogee_leaders_app/core/utilities/route_names.dart';
import 'package:apogee_leaders_app/core/enums/view_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebaseAuth = FirebaseAuth.instance;
  String _email;

  String get email => _email;
  String _password;

  String get password => _password;
  String _firstName;

  String get firstName => _firstName;
  String _lastName;

  String get lastName => _lastName;

  Future init() async {
    print("Registration ViewModel init()");
    setState(ViewState.Busy);
    try {
      print('try registration statement');
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);
  }

  void registerUser() {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(
          email: _email, password: _password);
    } catch (e) {
      print("Failed to Register User: $e");
    }
    routeToHomeView();
    _firebaseAuth.currentUser.updateDisplayName(_firstName + " " + _lastName);
    print(_firebaseAuth.currentUser.displayName);
  }

  void setFirstName(String inputString) {
    _firstName = inputString;
  }

  void setLastName(String inputString) {
    _lastName = inputString;
  }

  void setEmailAddress(String inputString) {
    _email = inputString;
  }

  void setPassword(String inputString) {
    _password = inputString;
  }
  //
  // String getName() {
  //   return _firebaseAuth.currentUser.displayName;
  // }

  void routeToHomeView() {
    _navigationService.navigateTo(HomeViewRoute);
  }

  void routeToLoginView() {
    _navigationService.navigateTo(LoginViewRoute);
  }
}
