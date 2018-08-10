import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'hero.dart';

@Component(
  selector: 'toh-hero',
  templateUrl: 'hero_component.html',
  styleUrls: [ 'hero_component.css' ],
  directives: [ coreDirectives, formDirectives ]
)
class HeroComponent {
  
  @Input()
  Hero hero;
  
}