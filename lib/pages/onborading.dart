import 'package:animacoes_explicitas/components/button.dart';
import 'package:animacoes_explicitas/components/change_theme_button.dart';
import 'package:animacoes_explicitas/components/slide_image_theme/slide_image_dark.dart';
import 'package:animacoes_explicitas/components/slide_image_theme/slide_image_light.dart';
import 'package:animacoes_explicitas/models/slide.dart';
import 'package:animacoes_explicitas/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final slide = Slide;
  bool lights = true;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.toInt() ?? 0;
      });
    });
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _currentPage == 0
            ? null
            : InkWell(
                onTap: () {
                  _pageController.animateToPage(_currentPage - 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: Theme.of(context).secondaryHeaderColor,
                  size: 30.0,
                ),
              ),
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: slideListLight.length,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemBuilder: (BuildContext context, int index) {
                  return themeProvider.themeMode == ThemeMode.light
                      ? SlideImageLight(index: index)
                      : SlideImageDark(index: index);
                },
              ),
            ),
            //
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (indexDots) {
                      return Container(
                        margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                        width: _currentPage == indexDots ? 25 : 15,
                        height: 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: _currentPage == indexDots
                                ? Theme.of(context).cardColor
                                : Theme.of(context).secondaryHeaderColor),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  slideListLight[_currentPage].description,
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ButtonPage(
              onPressed: () {
                _pageController.animateToPage(_currentPage + 1,
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeInToLinear);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
