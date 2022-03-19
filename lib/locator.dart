import 'package:apogee_leaders_app/viewmodels/home_viewmodel.dart';
import 'package:apogee_leaders_app/viewmodels/recipe_viewmodel.dart';
import 'package:apogee_leaders_app/viewmodels/weather_viewmodel.dart';
import 'package:apogee_leaders_app/viewmodels/map_viewmodel.dart';
import 'package:apogee_leaders_app/viewmodels/login_viewmodel.dart';
import 'package:apogee_leaders_app/viewmodels/registration_viewmodel.dart';
import 'package:apogee_leaders_app/core/services/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'viewmodels/home_viewmodel.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  _setupViewModels();
  _setupServices();
}


Future _setupViewModels() async {
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  locator.registerLazySingleton<RecipeViewModel>(() => RecipeViewModel());
  locator.registerLazySingleton<WeatherViewModel>(() => WeatherViewModel());
  locator.registerLazySingleton<MapViewModel>(() => MapViewModel());
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  locator.registerLazySingleton<RegistrationViewModel>(() => RegistrationViewModel());


}
Future _setupServices() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
}