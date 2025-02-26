import 'package:expense_tracker/login_guide/cubit/login_guide_cubit.dart';
import 'package:expense_tracker/login_guide/view/login_guide_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginGuidePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider( create: (context) => PageCubit(), child: LoginGuideView());
    
      }
}