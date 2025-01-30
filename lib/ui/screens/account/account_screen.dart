import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/controller/user_controller.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/screens/account/account_viewmodel.dart';
import 'package:music_app/ui/widgets/app_bar.dart';
import 'package:music_app/ui/widgets/big_category_item.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/text_input.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    AccountViewmodel viewmodel = Get.put(AccountViewmodel());

    return Scaffold(
      bottomNavigationBar: MainBottomButton(
        text: 'Save',
        onPress: () {},
      ),
      backgroundColor: AppColors.shapeBackground,
      body: SafeArea(
        child: Column(
          children: [
            const CAppBar(title: 'Account'),
            generalBox,
            Expanded(
              child: SingleChildScrollView(
                padding: generalPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CTextInputWithTitle(
                      title: 'Name',
                      hint: 'your name',
                      controller: TextEditingController(
                        text: userController.currentUser.name,
                      ),
                      backgroundColor: AppColors.white,
                    ),
                    generalBox,
                    CTextInputWithTitle(
                      title: 'Date of Birthday',
                      hint: '10/10/1910',
                      controller: TextEditingController(
                        text: userController.currentUser.dateOfBirth == null
                            ? ''
                            : '10/10/1910',
                      ),
                      backgroundColor: AppColors.white,
                    ),
                    generalBox,
                    const CTextInputWithTitle(
                      title: 'Country',
                      hint: 'UAE',
                      backgroundColor: AppColors.white,
                    ),
                    generalBox,
                    const CTextInputWithTitle(
                      title: 'City',
                      hint: 'Dubai',
                      backgroundColor: AppColors.white,
                    ),
                    generalBox,
                    Row(
                      children: [
                        generalSmallBox,
                        Text(
                          'Gender',
                          style: tStyles['black14'],
                        ),
                      ],
                    ),
                    generalSmallBox,
                    GetBuilder(builder: (AccountViewmodel viewmodel) {
                      return Row(
                        children: [
                          Expanded(
                            child: BigCategoryItem(
                              isSelected: viewmodel.gender == 'Male',
                              text: 'Male',
                              onPress: () {
                                viewmodel.setGender('Male');
                              },
                            ),
                          ),
                          generalSmallBox,
                          Expanded(
                            child: BigCategoryItem(
                              isSelected: viewmodel.gender == 'Female',
                              text: 'Female',
                              onPress: () {
                                viewmodel.setGender('Female');
                              },
                            ),
                          ),
                          generalSmallBox,
                          Expanded(
                            child: BigCategoryItem(
                              isSelected:
                                  viewmodel.gender == 'Rather not to say',
                              text: 'Rather not to say',
                              horizontalPadding: 8,
                              onPress: () {
                                viewmodel.setGender('Rather not to say');
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
