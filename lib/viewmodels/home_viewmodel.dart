import 'package:apogee_leaders_app/viewmodels/base_viewmodel.dart';
import 'package:apogee_leaders_app/core/enums/view_state.dart';
import 'package:apogee_leaders_app/locator.dart';
import 'package:apogee_leaders_app/core/services/navigation_service.dart';
import 'package:apogee_leaders_app/core/utilities/route_names.dart';


class HomeViewModel extends BaseViewModel {
  final  _navigationService = locator<NavigationService>();
  bool pageLoaded = true;

  Future init() async {
    print("HomeViewModel init()");
    setState(ViewState.Busy);
    try {
      pageLoaded = true;
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);

  }

  void routeToRecipeView() {
    _navigationService.navigateTo(RecipeViewRoute);
  }
  void routeToRegistrationView() {
    _navigationService.navigateTo(RegistrationViewRoute);
  }
  void routeToLoginView() {
    _navigationService.navigateTo(LoginViewRoute);
  }

  void routeToWeatherView() {
    _navigationService.navigateTo(WeatherViewRoute);
  }

  void routeToMapView() {
    _navigationService.navigateTo(MapViewRoute);
  }
}