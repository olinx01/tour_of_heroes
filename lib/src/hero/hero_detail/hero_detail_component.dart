import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import '../hero.dart';

@Component(
  selector: 'toh-hero-detail',
  templateUrl: 'hero_detail_component.html',
  styleUrls: [ 'hero_detail_component.css' ],
  directives: [ coreDirectives, formDirectives ]
)
class HeroDetailComponent {

  @Input()
  Hero hero;

}