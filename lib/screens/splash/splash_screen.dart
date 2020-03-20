import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_movie_list_flutter/bloc/index.dart';
import 'package:the_movie_list_flutter/routes/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      child: Container(
        color: ColorSets.blackPearl,
        child: SvgPicture.asset('assets/images/logo.svg', height: 32),
      ),
      listener: (context, state) async {
        final NavigatorState navigator = Navigator.of(context);
        if (state is AppStateSuccess) {
          // navigator.pushReplacementNamed(AppRoutes.home.key);
        }
      }
    );
  }
}