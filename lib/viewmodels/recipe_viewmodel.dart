import 'package:skyline_template_app/core/utilities/route_names.dart';
import 'package:skyline_template_app/viewmodels/base_viewmodel.dart';
import 'package:skyline_template_app/core/enums/view_state.dart';
import 'package:skyline_template_app/model/Ingredient.dart';
import 'package:skyline_template_app/core/services/navigation_service.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:faker/faker.dart';

class RecipeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  List<Ingredient> ingredients = [];
  bool pageLoaded = false;

  Future init() async {
    print("Recipe ViewModel init()");
    setState(ViewState.Busy);
    try {
      pageLoaded = true;
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);
  }

  void routeToHomeView() {
    _navigationService.navigateTo(HomeViewRoute);
  }
}
