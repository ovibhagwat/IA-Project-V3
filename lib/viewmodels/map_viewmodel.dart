import 'package:apogee_leaders_app/core/utilities/route_names.dart';
import 'package:apogee_leaders_app/viewmodels/base_viewmodel.dart';
import 'package:apogee_leaders_app/core/enums/view_state.dart';
import 'package:apogee_leaders_app/core/services/navigation_service.dart';
import 'package:apogee_leaders_app/locator.dart';

class MapViewModel extends BaseViewModel {
  final  _navigationService = locator<NavigationService>();
  bool pageLoaded = false;

  Future init() async {
    print("Map ViewModel init()");
    setState(ViewState.Busy);
    try {
      pageLoaded = true;
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);

  }

  void routeToHomeView(){
    _navigationService.navigateTo(HomeViewRoute);
  }

}