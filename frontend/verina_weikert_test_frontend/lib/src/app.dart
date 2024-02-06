import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verina_weikert_test_frontend/src/bindings/auth.binding.dart';
import 'package:verina_weikert_test_frontend/src/bindings/clients.binding.dart';
import 'package:verina_weikert_test_frontend/src/bindings/tags.binding.dart';
import 'package:verina_weikert_test_frontend/src/bindings/user.binding.dart';
import 'package:verina_weikert_test_frontend/src/views/auth/sign-in/signin.screen.dart';
import 'package:verina_weikert_test_frontend/src/views/clients-screen/clients.screen.dart';
import 'package:verina_weikert_test_frontend/src/views/home/home.screen.dart';
import 'package:verina_weikert_test_frontend/src/views/tags-screen/tags.screen.dart';
//import 'package:verina_weikert_test_frontend/src/views/home/home.scree.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(
          name: "login", 
          page: () => const LoginScreen(), 
          bindings: [ 
            AuthBinding(),
            UserBinding(),
            ClientsBinding(),
            TagsBinding()
          ]
        ),
        GetPage(
          name: "home", 
          page: () => const HomeScren(), 
          bindings: [
            UserBinding(),
            ClientsBinding(),
            TagsBinding()
          ]
        ),
        GetPage(
          name: "clients", 
          page: () => const ClientsScreen(), 
          bindings: [
            UserBinding(),
            ClientsBinding(),
            TagsBinding()
          ]
        ),
        GetPage(
          name: "tags", 
          page: () => const TagsScreen(), 
          bindings: [ 
            UserBinding(),
            ClientsBinding(),
            TagsBinding()
          ]
        ),
      ],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: const LoginScreen(),
    );
  }
}