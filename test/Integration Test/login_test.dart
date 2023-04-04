import 'package:calori_fit/main.dart' as app;
import 'package:calori_fit/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("test login", () { 
    testWidgets('tap on login', (widgetTester) async{
      app.main();
      widgetTester.pumpWidget(const LoginScreen());
      final Finder fab = find.byWidget(GestureDetector());
      await widgetTester.tap(fab);
      await widgetTester.pumpAndSettle();
      expect(find.text('Please Enter an email'), findsOneWidget);
    });
  });
}