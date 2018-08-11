import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'src/dashboard/dashboard_component.template.dart' as dashboard_component_template;
import 'src/hero/hero_list/hero_list_component.template.dart' as hero_list_component_template;
import 'src/not_found/not_found_component.template.dart' as not_found_component_template;

class Routes {

  static final redirect = RouteDefinition.redirect(
    path: '',
    redirectTo: RoutePaths.dashboard.toUrl()
  );

  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_component_template.DashboardComponentNgFactory
  );

  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_list_component_template.HeroListComponentNgFactory
  );

  static final notFound = RouteDefinition(
    path: '.+',
    component: not_found_component_template.NotFoundComponentNgFactory
  );

  static final all = <RouteDefinition>[
    redirect,
    dashboard,
    heroes,
    notFound
  ];

}