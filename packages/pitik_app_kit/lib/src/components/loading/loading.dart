import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

class PitikLoading extends StatelessWidget {
  const PitikLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.stretchedDots(color: PitikColors.primaryOrange, size: 64),
    );
  }
}
