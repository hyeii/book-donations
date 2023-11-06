import 'package:animate_do/animate_do.dart';
import 'package:bookdone/onboard/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _HomePageState();
}

class _HomePageState extends State<OnboardingPage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// Anime
  Widget animationDo(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  List<Items> listOfItems = [
    Items(
      img: "assets/images/Bibliophile-rafiki.svg",
      title: "책을 읽고?? 또 읽고????",
      subTitle: "버리기는 아깝고, 그대로 두자니 공간만 차지하는 책들이 있나여",
    ),
    Items(
      img: "assets/images/Charity-rafiki.svg",
      title: "책도네로 책을 기부해용",
      subTitle: "나에게 필요없는 책이 \n누군가는 읽고싶을수도있음",
    ),
    Items(
      img: "assets/images/Group-rafiki.svg",
      title: "지속 가능한 선순환",
      subTitle: "책도네로 시작하세용",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: pageController,
              itemCount: listOfItems.length,
              onPageChanged: (newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    children: [
                      /// IMG
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                        width: size.width,
                        height: size.height / 2.5,
                        child: animationDo(
                          index,
                          100,
                          SvgPicture.asset(listOfItems[index].img),
                        ),
                      ),

                      /// TITLE TEXT
                      Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: animationDo(
                            index,
                            300,
                            Text(
                              listOfItems[index].title,
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium,
                            ),
                          )),

                      /// SUBTITLE TEXT
                      animationDo(
                        index,
                        500,
                        Text(
                          listOfItems[index].subTitle,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),

          /// ---------------------------
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentIndex == 2

                  /// GET STARTED BTN
                  ? animationDo(
                      3, 200, GetStartBtn(size: size, textTheme: textTheme))

                  /// SKIP BTN
                  : SizedBox.shrink(),
              SizedBox(
                height: 30,
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: listOfItems.length,
                effect: const ExpandingDotsEffect(
                  spacing: 6.0,
                  radius: 10.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  expansionFactor: 3.8,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.brown,
                ),
                onDotClicked: (newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                    pageController.animateToPage(newIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
