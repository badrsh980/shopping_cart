import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/bloc/card_shop_bloc.dart';
import 'package:shopping_cart/bloc_theme/theme_bloc_bloc.dart';
import 'package:shopping_cart/data/globals.dart';
import 'package:shopping_cart/screens/cart_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getProductObjects();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CardShopBloc()),
        BlocProvider(
            create: (context) =>
                ThemeBlocBloc(sharedPreferences: sharedPreferences)),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBlocBloc, ThemeBlocState>(
      builder: (context, state) {
        if (state is GetThemeState) {
          return MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            home: CartScreen(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
