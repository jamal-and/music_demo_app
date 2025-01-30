import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/screens/signup/signup_viewmodel.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/containers.dart';
import 'package:music_app/ui/widgets/csvg.dart';
import 'package:music_app/ui/widgets/text_input.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Duration animationDuration = 1000.milliseconds;
    Curve curve = Curves.easeOutCubic;
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder(
            init: SignupViewmodel(),
            builder: (SignupViewmodel viewmodel) {
              return AnimatedSwitcher(
                duration: animationDuration,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 1.sh,
                      width: 1.sw,
                    ),
                    buildHeader(viewmodel, curve, animationDuration),
                    buildLogo(viewmodel, curve),
                    buildBackButton(viewmodel),
                    buildCreateAccountSheet(viewmodel, curve),
                    buildProfileSetup(viewmodel, curve),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Positioned buildBackButton(SignupViewmodel viewmodel) {
    return Positioned(
      left: horizontalSpacing,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (viewmodel.step == 0) {
              Get.back();
            } else {
              viewmodel.onMainButtonPressed();
            }
          },
          child: Container(
            decoration: circleDecoration(
              color: viewmodel.step == 0
                  ? AppColors.white.withOpacity(0.2)
                  : AppColors.white,
              withShadow: true,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              CupertinoIcons.back,
              color:
                  viewmodel.step == 0 ? AppColors.white : AppColors.textLight,
            ),
          ),
        ),
      ),
    );
  }

  Positioned buildLogo(SignupViewmodel viewmodel, Curve curve) {
    return Positioned(
      left: 0,
      right: 0,
      top: 1.sh * 0.23,
      child: AnimatedScale(
        duration: 0.7.seconds,
        scale: viewmodel.step == 0 ? 1 : 0,
        curve: curve,
        child: const MySvg(Assets.assetsSvgsLogoText),
      ),
    );
  }

  AnimatedCrossFade buildHeader(
      SignupViewmodel viewmodel, Curve curve, Duration animationDuration) {
    return AnimatedCrossFade(
      firstChild: buildfFirstHeader(),
      secondChild: buildSecondHeader(viewmodel),
      firstCurve: curve,
      secondCurve: curve,
      crossFadeState: viewmodel.step == 0
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: animationDuration,
    );
  }

  Image buildfFirstHeader() {
    return Image.asset(
      Assets.assetsImagesSignupBg,
      colorBlendMode: BlendMode.luminosity,
      fit: BoxFit.cover,
      height: 1.sh * 0.5,
      width: 1.sw,
    );
  }

  Container buildSecondHeader(SignupViewmodel viewmodel) {
    return Container(
      height: 1.sh * 0.5,
      width: 1.sw,
      padding: generalSmallPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 1.sw,
            decoration: cardDecoration(
              borderRadius: BorderRadius.circular(
                horizontalSpacing,
              ),
            ),
            padding: generalPadding,
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: circleDecoration(
                        color: AppColors.white,
                        withShadow: true,
                      ),
                      padding: generalPadding,
                      child: const MySvg(
                        Assets.assetsSvgsPersonUser,
                      ),
                    ),
                    Text(
                      viewmodel.name.capitalize ?? '',
                      style: tStyles['black16semi'],
                    ),
                    Text(
                      '@${viewmodel.username}',
                      style: tStyles['grey12mid'],
                    )
                  ],
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration:
                                  cardDecoration(color: AppColors.white),
                              padding: generalPadding,
                              child: Container(
                                decoration: cardDecoration(),
                                padding: generalSmallPadding,
                              ),
                            ),
                          ),
                          generalSmallBox,
                          Expanded(
                            child: Container(
                              decoration:
                                  cardDecoration(color: AppColors.white),
                              padding: generalPadding,
                              child: Container(
                                decoration: cardDecoration(),
                                padding: generalSmallPadding,
                              ),
                            ),
                          )
                        ],
                      ),
                      generalSmallBox,
                      Container(
                        decoration: cardDecoration(color: AppColors.white),
                        padding: generalPadding,
                        width: 1.sw,
                        child: Container(
                          decoration: cardDecoration(),
                          width: horizontalSpacing,
                          padding: generalSmallPadding,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AnimatedPositioned buildProfileSetup(SignupViewmodel viewmodel, Curve curve) {
    return AnimatedPositioned(
      duration: (viewmodel.step == 1 ? 1 : 1.5).seconds,
      curve: curve,
      top: viewmodel.step == 0 ? 1.sh : 1.sh * 0.4,
      left: 0,
      right: 0,
      child: SheetContainer(
        height: 1.sh - 1.sh * 0.4,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Expanded(
                //   child: CupertinoButton(
                //     onPressed: () {},
                //     padding: EdgeInsets.symmetric(
                //       horizontal: horizontalSpacing,
                //       vertical: verticalSpacing / 3,
                //     ),
                //     minSize: 0,
                //     child: Container(
                //       alignment: Alignment.centerLeft,
                //       child: const Icon(
                //         CupertinoIcons.back,
                //         color: AppColors.black,
                //       ),
                //     ),
                //   ),
                // ),
                Text(
                  'Profile Setup',
                  style: tStyles['black25semi'],
                ),
                //const Spacer(),
              ],
            ),
            generalBox,
            CTextInputWithTitle(
              title: 'Handle',
              hint: 'username',
              icon: Assets.assetsSvgsAtIcon,
              onChange: viewmodel.onUsernameChange,
              controller: viewmodel.usernameController,
            ),
            generalBox,
            CTextInputWithTitle(
              title: 'Name',
              hint: 'Name Surname',
              icon: Assets.assetsSvgsPersonUser,
              onChange: viewmodel.onNameChange,
              controller: viewmodel.nameController,
            ),
            generalBox,
            const CTextInputWithTitle(
              title: 'Country',
              hint: 'UAE',
              icon: Assets.assetsSvgsRegionWorld,
            ),
            const Spacer(),
            SafeArea(
              top: false,
              child: FullWidthButton(
                text: 'Create Account',
                onPress: () {
                  viewmodel.onMainButtonPressed();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedPositioned buildCreateAccountSheet(
    SignupViewmodel viewmodel,
    Curve curve,
  ) {
    return AnimatedPositioned(
      duration: (viewmodel.step == 0 ? 1 : 2).seconds,
      curve: curve,
      top: viewmodel.step == 0 ? 1.sh * 0.4 : 1.sh,
      left: 0,
      right: 0,
      child: SheetContainer(
        height: 1.sh - 1.sh * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Create Account',
                style: tStyles['black25semi'],
              ),
            ),
            generalBox,
            generalBox,
            const CTextInputWithTitle(
              hint: 'jamal@example.com',
              icon: Assets.assetsSvgsMail,
              title: 'Email',
            ),
            generalBox,
            const CTextInputWithTitle(
              hint: 'enter your password',
              icon: Assets.assetsSvgsLock,
              title: 'Password',
              isPassword: true,
            ),
            generalBox,
            const CTextInputWithTitle(
              hint: 'repat your password',
              icon: Assets.assetsSvgsLock,
              title: 'Repat Password',
              isPassword: true,
            ),
            const Spacer(),
            SafeArea(
              top: false,
              child: FullWidthButton(
                text: 'Continue',
                onPress: () {
                  viewmodel.onMainButtonPressed();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
