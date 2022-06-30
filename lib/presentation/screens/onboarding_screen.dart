import 'package:fast_food/generated/resource.dart';
import 'package:fast_food/logic/cubit/page_cubit.dart';
import 'package:fast_food/presentation/widgets/app_button.dart';
import 'package:fast_food/theme/colors.dart';
import 'package:fast_food/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> images = [R.ASSETS_PNG_ONBOARDING1_PNG, R.ASSETS_PNG_ONBOARDING2_PNG, R.ASSETS_PNG_ONBOARDING3_PNG];
  List<String> body = [
    'Connect with people with similar hobbies in your city. Just add your activities and meet with them!',
    'Set preferences for multiple users from various restaurants!',
    'Fast, rescued food at your service.'
  ];
  List<String> titles = ['Hobbies Are Fun!', 'Find Hobbies', '5 Hobbies Nearby!'];
  List<TextStyle> textStyles = [
    typoCrimRegular40.copyWith(color: colorBlack),
    typoCrimRegular40.copyWith(color: colorBlack),
    typoCrimRegular40.copyWith(color: colorBlack),
  ];
  List<Color> backgroundOnboard = [colorGreen1, colorPink1, colorBlue1];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<PageCubit, PageState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(color: backgroundOnboard[state.pageIndex]),
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: 3,
                      onPageChanged: (index) {
                        BlocProvider.of<PageCubit>(context).changePage(index);
                      },
                      itemBuilder: (context, index) => OnboardingItem(
                        image: images[index],
                        title: titles[index],
                        textStyle: textStyles[index],
                        body: body[index],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        3,
                        ((index) => Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: DotIndicator(
                                isActive: index == state.pageIndex,
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  BlocBuilder<PageCubit, PageState>(
                    builder: (context, state) {
                      return state.pageIndex != 2
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: (() {}),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
                                    decoration: BoxDecoration(border: Border.all(color: colorBlack)),
                                    child: Text(
                                      'Skip',
                                      style: typoNunitoBold18.copyWith(color: colorBlack),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    BlocProvider.of<PageCubit>(context).changePage(state.pageIndex + 1);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
                                    decoration: const BoxDecoration(color: Colors.black),
                                    child: Text(
                                      'Next',
                                      style: typoNunitoBold18.copyWith(color: colorWhite),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
                              decoration: const BoxDecoration(color: Colors.black),
                              child: Text(
                                'Lest\'s Start',
                                style: typoNunitoBold18.copyWith(color: colorWhite),
                              ),
                            );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? colorBlack : colorWhite,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    Key? key,
    required this.image,
    required this.title,
    required this.body,
    required this.textStyle,
  }) : super(key: key);

  final String image, title, body;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Image.asset(
          image,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(title, textAlign: TextAlign.center, style: textStyle),
        const SizedBox(
          height: 10,
        ),
        Text(body, textAlign: TextAlign.center, style: typoCrimRegular18),
      ],
    );
  }
}
