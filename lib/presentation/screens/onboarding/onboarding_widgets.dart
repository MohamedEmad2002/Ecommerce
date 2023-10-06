import 'package:flutter/material.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;
  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

List<OnBoardingModel> boardingList = [
    OnBoardingModel(
      image: 'assets/images/one.png',
      title: 'TitleOnBoarding 1',
      body: 'BodyOnBoarding 1',
    ),
    OnBoardingModel(
      image: 'assets/images/two.png',
      title: 'TitleOnBoarding 2',
      body: 'BodyOnBoarding 2',
    ),
    OnBoardingModel(
      image: 'assets/images/three.png',
      title: 'TitleOnBoarding 3',
      body: 'BodyOnBoarding 3',
    ),
  ];

  Widget buildBoardingItem(OnBoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );