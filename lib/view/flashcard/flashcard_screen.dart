import 'dart:math' as math;

import 'package:flashcard/model/theory/theory_word_json_object.dart';
import 'package:flashcard/view/base/bounce_widget.dart';
import 'package:flashcard/viewmodel/extensions/size_ext.dart';
import 'package:flashcard/viewmodel/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/helper/color_helper.dart';
import '../../viewmodel/helper/preference_helper.dart';
import '../../viewmodel/helper/provider/app_provider.dart';
import '../../viewmodel/helper/ui_font.dart';
import '../base/base_stateful.dart';

class FlashcardScreen extends BasePage {
  final List<TheoryWord>? wordList;
  const FlashcardScreen({required this.wordList, super.key});

  @override
  BasePageState<FlashcardScreen> createState() => _FlashcardScreenState();
}

class DisplayOption {
  static int showFrenchFirst = 0;
  static int showMeaningFirst = 1;
  static int showRandom = 2;
}

class _FlashcardScreenState extends BasePageState<FlashcardScreen>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  AnimationStatus animationStatus = AnimationStatus.dismissed;
  final CardSwiperController _cardSwiperController = CardSwiperController();

  List<TheoryWord> wordList = [];
  bool isShuffled = false;
  int numberNeedPractice = 0, numberPracticed = 0, totalNumber = 0;
  double widthScreen = 0.0, heightScreen = 0.0;

  @override
  void initState() {
    totalNumber = widget.wordList?.length ?? 0;
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    int random = math.Random().nextInt(1);
    _animation = context.read<AppProvider>().displayOption ==
            DisplayOption.showFrenchFirst
        ? Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
        : context.read<AppProvider>().displayOption ==
                DisplayOption.showMeaningFirst
            ? Tween<double>(begin: 1.0, end: 0.0).animate(_animationController)
            : Tween<double>(begin: random - 0.0, end: random - 1.0)
                .animate(_animationController);
    _animation
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        animationStatus = status;
      });
    wordList.addAll(widget.wordList ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paddingBottom =
        context.select((AppProvider provider) => provider.paddingBottom);
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(bottom: paddingBottom + 16.0.dp()),
        color: theme(
            ColorHelper.colorBackgroundDay, ColorHelper.colorBackgroundNight),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: preferenceHelper.paddingInsetsTop),
              decoration: BoxDecoration(
                  color: theme(ColorHelper.colorBackgroundChildDay,
                      ColorHelper.colorPrimary),
                  boxShadow: kElevationToShadow[3]),
              child: Row(children: [
                BounceWidget(
                    child: Container(
                      width: preferenceHelper.appBarHeight,
                      height: preferenceHelper.appBarHeight,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        "ic_back".withIcon(),
                        width: 20.0.dp(),
                        height: 20.0.dp(),
                        colorFilter: ColorFilter.mode(
                            theme(ColorHelper.colorTextDay, Colors.white),
                            BlendMode.srcIn),
                      ),
                    ),
                    onPress: () {
                      Navigator.pop(context);
                    }),
                Expanded(
                  child: Text(
                    "Flashcard",
                    textAlign: TextAlign.start,
                    style: UIFont.fontAppBold(
                        17.0.sp(),
                        theme(ColorHelper.colorTextDay,
                            ColorHelper.colorTextNight)),
                  ),
                ),
                // _iconAppBarButton("ic_note", () {}),
                _iconAppBarButton(isShuffled ? "ic_repeat" : "ic_random", () {
                  _changeShuffleList();
                }),
                _iconAppBarButton("ic_settings", () {
                  // OptionFlashCardDialog.show(context);
                }),
              ]),
            ),
            Flexible(
              child: numberPracticed < totalNumber
                  ? _listFlashCard()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Finish Flashcard",
                          style: UIFont.fontAppBold(
                              17.0.sp(),
                              theme(ColorHelper.colorTextDay,
                                  ColorHelper.colorTextNight)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              numberPracticed = 0;
                              numberNeedPractice = 0;
                              wordList.clear();
                              wordList.addAll(widget.wordList ?? []);
                            });
                          },
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8)),
                            backgroundColor: WidgetStateProperty.all(
                                ColorHelper.colorPrimary),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                          child: Text(
                            "Refresh",
                            style: UIFont.fontAppBold(
                              17.0.sp(),
                              theme(ColorHelper.colorTextDay,
                                  ColorHelper.colorTextNight),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
            _bottomProgressBar(),
          ],
        ),
      ),
    );
  }

  Widget _iconAppBarButton(String icon, Function() onPress) {
    return BounceWidget(
        scale: 0.88,
        child: Container(
          width: preferenceHelper.appBarHeight,
          height: preferenceHelper.appBarHeight,
          color: Colors.transparent,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            icon.withIcon(),
            width: 22.0.dp(),
            height: 22.0.dp(),
            colorFilter: ColorFilter.mode(
                theme(ColorHelper.colorTextDay, Colors.white), BlendMode.srcIn),
          ),
        ),
        onPress: () {
          onPress();
        });
  }

  Widget _listFlashCard() {
    final fontChange =
        context.select((AppProvider provider) => provider.fontSizeChange);

    return CardSwiper(
        controller: _cardSwiperController,
        cardsCount: wordList.length,
        initialIndex: 0,
        onSwipe: (previousIndex, currentIndex, direction) {
          setState(() {
            if (direction == CardSwiperDirection.left) {
              numberNeedPractice++;
            } else {
              numberPracticed++;
              wordList.removeAt(
                  previousIndex >= wordList.length ? 0 : previousIndex);
              if (wordList.length < 2) {
                wordList.add(wordList.first);
              }
            }
          });
          return true;
        },
        onSwipeDirectionChange: (horizontalDirection, verticalDirection) {},
        // onSwipeFinished: (previousIndex, currentIndex, direction) {
        //   if (direction != CardSwiperDirection.left) {
        //     _cardSwiperController.undo();
        //   }
        // },
        maxAngle: 0,
        numberOfCardsDisplayed: 2,
        backCardOffset: const Offset(0, 20),
        padding: const EdgeInsets.all(24.0),
        cardBuilder: (
          context,
          index,
          horizontalThresholdPercentage,
          verticalThresholdPercentage,
        ) {
          if (index >= wordList.length) index = 0;
          double heightPercent =
              verticalThresholdPercentage.abs() / heightScreen / 2;
          double widthPercent =
              horizontalThresholdPercentage.abs() / widthScreen / 2;
          bool isGotIt = horizontalThresholdPercentage >= 0;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(2, 1, 0.0015)
              ..rotateY(math.pi * _animation.value),
            child: GestureDetector(
              onTap: () {
                if (animationStatus == AnimationStatus.dismissed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              },
              child: Container(
                margin: EdgeInsets.all(10.0.dp()),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    color: theme(ColorHelper.colorBackgroundChildDay,
                        ColorHelper.colorBackgroundChildNight)),
                child: Stack(
                  children: [
                    if (widthPercent <= 1 && heightPercent <= 1)
                      AnimatedContainer(
                        decoration: BoxDecoration(
                          color: isGotIt
                              ? ColorHelper.colorPrimary.withOpacity(
                                  math.max(widthPercent, heightPercent))
                              : ColorHelper.colorAccent.withOpacity(
                                  math.max(widthPercent, heightPercent)),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0)),
                        ),
                        width: double.infinity,
                        height: 80.0.dp(),
                        duration: Duration.zero,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateY(math.pi * _animation.value),
                          child: Center(
                            child: Text(
                              isGotIt ? "I got it" : "Need to Study",
                              style: UIFont.fontAppBold(
                                (18.0 + fontChange * 2).sp(),
                                theme(
                                  ColorHelper.colorTextDay.withOpacity(
                                      math.max(widthPercent, heightPercent)),
                                  ColorHelper.colorTextNight.withOpacity(
                                      math.max(widthPercent, heightPercent)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    _animation.value >= 0.5
                        // is show French
                        ? Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(math.pi),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          _playAudio(
                                              audio: wordList[index].audio);
                                        },
                                        child: Container(
                                          width: 44.0.dp(),
                                          height: 36.0.dp(),
                                          color: Colors.transparent,
                                          padding: EdgeInsets.fromLTRB(
                                              13.0.dp(),
                                              9.0.dp(),
                                              13.0.dp(),
                                              9.0.dp()),
                                          child: SvgPicture.asset(
                                              "ic_speaker_2".withIcon(),
                                              colorFilter: ColorFilter.mode(
                                                  theme(
                                                      ColorHelper.colorTextDay,
                                                      ColorHelper
                                                          .colorTextNight),
                                                  BlendMode.srcIn)),
                                        )),
                                  ],
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      wordList[index].word ?? "",
                                      style: UIFont.fontAppBold(
                                          (18.0 + fontChange * 2).sp(),
                                          theme(ColorHelper.colorTextDay,
                                              ColorHelper.colorTextNight)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        // is show meaning
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          _playAudio(
                                            audio: wordList[index].audio,
                                          );
                                        },
                                        child: Container(
                                          width: 44.0.dp(),
                                          height: 36.0.dp(),
                                          color: Colors.transparent,
                                          padding: EdgeInsets.fromLTRB(
                                              13.0.dp(),
                                              9.0.dp(),
                                              13.0.dp(),
                                              9.0.dp()),
                                          child: SvgPicture.asset(
                                              "ic_speaker_2".withIcon(),
                                              colorFilter: ColorFilter.mode(
                                                  theme(
                                                      ColorHelper.colorTextDay,
                                                      ColorHelper
                                                          .colorTextNight),
                                                  BlendMode.srcIn)),
                                        )),
                                  ],
                                ),
                                Text(
                                  wordList[index].word ?? "",
                                  style: UIFont.fontAppBold(
                                      (18.0 + fontChange * 2).sp(),
                                      theme(ColorHelper.colorTextGreenDay,
                                          ColorHelper.colorTextGreenNight)),
                                ),
                                SizedBox(height: 16.0.dp()),
                                Text(
                                  wordList[index].mean ?? "",
                                  style: UIFont.fontApp(
                                      (15.0 + fontChange * 2).sp(),
                                      theme(ColorHelper.colorTextDay,
                                          ColorHelper.colorTextNight)),
                                ),
                                SizedBox(height: 16.0.dp()),
                                wordList[index].results == [] ||
                                        wordList[index].results == null
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Example",
                                            style: UIFont.fontAppBold(
                                                (14.0 + fontChange * 2).sp(),
                                                theme(ColorHelper.colorTextDay,
                                                    ColorHelper.colorTextNight),
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                          SizedBox(height: 2.0.dp()),
                                          for (final example
                                              in (wordList[index])
                                                  .results!) ...[
                                            SizedBox(height: 8.0.dp()),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 16.0.dp()),
                                              child: Text(example.content ?? "",
                                                  style: UIFont.fontAppBold(
                                                      (15.0 + fontChange * 2)
                                                          .sp(),
                                                      theme(
                                                          ColorHelper
                                                              .colorTextDay,
                                                          ColorHelper
                                                              .colorTextNight))),
                                            ),
                                            SizedBox(height: 6.0.dp()),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 16.0.dp()),
                                              child: Text(example.mean ?? "",
                                                  style: UIFont.fontApp(
                                                      (14.0 + fontChange * 2)
                                                          .sp(),
                                                      theme(
                                                          ColorHelper
                                                              .colorTextDay,
                                                          ColorHelper
                                                              .colorTextNight))),
                                            ),
                                            SizedBox(height: 8.0.dp()),
                                          ],
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _bottomProgressBar() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: 20.0.dp(), left: 20.0.dp(), right: 20.0.dp()),
          child: LinearProgressIndicator(
            value: numberPracticed / totalNumber,
            backgroundColor: theme(ColorHelper.colorBackgroundChildDay,
                ColorHelper.colorBackgroundChildNight),
            valueColor: AlwaysStoppedAnimation<Color>(
                theme(ColorHelper.colorPrimary, ColorHelper.colorPrimary)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50.0.dp(),
              height: 50.0.dp(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorHelper.colorAccent,
              ),
              alignment: Alignment.center,
              child: Text(
                numberNeedPractice.toString(),
                style: UIFont.fontAppBold(17.0.sp(), ColorHelper.colorTextDay),
              ),
            ),
            const Spacer(),
            Container(
              width: 50.0.dp(),
              height: 50.0.dp(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorHelper.colorPrimary,
              ),
              alignment: Alignment.center,
              child: Text(
                numberPracticed.toString(),
                style:
                    UIFont.fontAppBold(17.0.sp(), ColorHelper.colorTextNight),
              ),
            )
          ],
        ),
      ],
    );
  }

  _playAudio({required String? audio}) {
    // if (lessonsId.isNullOrEmpty || domainUrl.isNullOrEmpty || audio.isNullOrEmpty) {
    //   return;
    // }
    // final audioUrl = "$domainUrl$audio";
    // final urlConvert = Utils.convertUrlData(lessonsId!, audioUrl);
    // if (urlConvert.isExistLocal) {
    //   Utils.playAudio("file://${urlConvert.url}");
    // }
  }

  _changeShuffleList() {
    if (isShuffled) {
      wordList.sort((a, b) => a.wordId!.compareTo(b.wordId!));
    } else {
      wordList.shuffle();
    }
    setState(() {
      isShuffled = !isShuffled;
    });
  }
}
