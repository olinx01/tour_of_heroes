import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart';
// import 'package:http/browser_client.dart';

import 'package:tour_of_heroes/app_component.template.dart' as ng;

import 'main.template.dart' as self;
import 'package:tour_of_heroes/in_memory_data_Service.dart';

@GenerateInjector([ 
  routerProvidersHash,
  // ClassProvider(BrowserClient)
  ClassProvider(Client, useClass: InMemoryDataService)
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}