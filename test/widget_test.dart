import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/config/app_theme.dart';
import 'package:todo_app/src/config/route_generator.dart';
import 'package:todo_app/src/di/injector_setup.dart';
import 'package:todo_app/src/presentation/screens/create_task_screen.dart';

class MockTodoTheme extends Mock implements TodoTheme {
  static ThemeData get light => ThemeData.light();

  static ThemeData get dark => ThemeData.dark();
}

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  Widget createWidgetTest() {
    return MaterialApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      theme: MockTodoTheme.light,
      darkTheme: MockTodoTheme.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const Scaffold(),
    );
  }

  group('App view', () {
    testWidgets('Application', (tester) async {
      await tester.pumpWidget(createWidgetTest());
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('Material app with correct themes', (tester) async {
      await tester.pumpWidget(createWidgetTest());
      expect(find.byType(MaterialApp), findsOneWidget);
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, equals(MockTodoTheme.light));
      expect(materialApp.darkTheme, equals(MockTodoTheme.dark));
    });
  });

  group('Task screen', () {
    testWidgets('Input field', (tester) async {
      final titleField = find.byKey(const ValueKey('titleField'));
      final confirmButton = find.byKey(const ValueKey('confirmButton'));

      await tester.pumpWidget(const MaterialApp(home: CreateTaskScreen()));
      await tester.enterText(titleField, 'title');
      await tester.press(confirmButton);
      await tester.pump(); //rebuild widget

      expect(find.text('title'), findsOneWidget);
    });
  });
}
