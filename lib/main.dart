import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bussiness_logic/app_cubit/cubit/appshop_cubit.dart';
import 'package:shop_app/bussiness_logic/bloc_observer/bloc_observer.dart';
import 'package:shop_app/bussiness_logic/login_cubit/cubit/login_cubit.dart';
import 'package:shop_app/bussiness_logic/login_cubit/cubit/login_state.dart';
import 'package:shop_app/bussiness_logic/search_cubit/cubit/search_cubit.dart';
import 'package:shop_app/constants/shard.dart';
import 'package:shop_app/data/dio/dio_helper.dart';
import 'package:shop_app/presentation/screens/auth/login_screen.dart';
import 'package:shop_app/presentation/screens/layout/layout.dart';
import 'package:shop_app/presentation/screens/onboarding/on_boarding_screen.dart';
import 'package:shop_app/shardpref/cash_helper.dart';

void main() async {
  WidgetsFlutterBinding();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  Widget? widget;

  bool? onBoarding = await CashHelper.getData(key: 'onBoarding');
  token = await CashHelper.getData(key: 'token');
  if (kDebugMode) {
    print(token);
  }
  if (kDebugMode) {
    print(onBoarding);
  }

  if (onBoarding != null) {
    if (token != null) {
      widget = const LayoutScreen();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Widget? startWidget;
  MyApp({super.key, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopLoginCubit(ShopLoginInitialState()),
        ),
        BlocProvider(
          create: (context) => SearchCubit(SearchInitial()),
        ),
        BlocProvider(
            create: (context) => AppshopCubit(AppshopInitial())
              ..getHomedata()
              ..getCategoriesdata()
              ..getUserData()
              ..getFavourites())
      ],
      child: MaterialApp(
        home: startWidget,
      ),
    );
  }
}
