import 'package:skyline_template_app/viewmodels/base_viewmodel.dart';
import 'package:skyline_template_app/core/enums/view_state.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:skyline_template_app/core/services/navigation_service.dart';
import 'package:skyline_template_app/core/utilities/route_names.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

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


  void routeToHomeView() {
    _navigationService.navigateTo(HomeViewRoute);
  }

  void routeToRegistrationView() {
    _navigationService.navigateTo(RegistrationViewRoute);
  }

}
