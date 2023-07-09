import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safewheel/ui/List_screen.dart';
import 'package:safewheel/utils/routes/route.dart';
import 'package:safewheel/utils/routes/routes_name.dart';
import 'myviewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MyViewModel()),
        ],
        child: const MaterialApp(
          home: ListScreen(),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
