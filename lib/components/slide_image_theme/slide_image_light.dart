import 'package:animacoes_explicitas/models/slide.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SlideImageLight extends StatelessWidget {
  final int index;
  const SlideImageLight({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Lottie.asset(slideListLight[index].animationPath),
      ),
    );
  }
}
