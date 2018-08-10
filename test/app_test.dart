@TestOn('browser')

import 'package:tour_of_heroes/app_component.dart';
import 'package:tour_of_heroes/app_component.template.dart' as ng;
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

void main() {
  final testBed =
      NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory);
  NgTestFixture<AppComponent> fixture;

  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  test('Default greeting', () {
    expect(fixture.text, 'Hey! This is Angular');
  });

  test('Greet world', () async {
    await fixture.update((c) => c.title = 'Tour of Heroes');
    expect(fixture.text, 'Tour of Heroes');
  });

  test('Greet world HTML', () {
    final html = fixture.rootElement.innerHtml;
    expect(html, '<h1>Hi! This is Angular</h1>');
  });
}