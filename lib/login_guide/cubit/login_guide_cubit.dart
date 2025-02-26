import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(0);
  final PageController pageController = PageController();
  void changePage(int index) {
    emit(index);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}

