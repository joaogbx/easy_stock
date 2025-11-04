import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/ui/theme/colors_pallete.dart';
import 'package:easy_stock/app/ui/user/screens/create_company/screens/steps/company_details_step.dart';
import 'package:easy_stock/app/ui/user/screens/create_company/screens/steps/company_explication_step.dart';
import 'package:easy_stock/app/ui/user/screens/create_company/screens/steps/company_welcome_step.dart';
import 'package:easy_stock/app/ui/user/screens/login/cubit/auth_cubit.dart';
import 'package:easy_stock/app/ui/user/screens/create_user/create_account_screen.dart';
import 'package:easy_stock/app/ui/user/screens/login/login_screen.dart';
import 'package:easy_stock/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCompanyScreen extends StatefulWidget {
  const CreateCompanyScreen({super.key});

  @override
  State<CreateCompanyScreen> createState() => _CreateCompanyScreenState();
}

class _CreateCompanyScreenState extends State<CreateCompanyScreen> {
  final PageController _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  final _cubit = getIt<AuthCubit>();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 10,
          right: 10,
          bottom: 30,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (value) {
                  _currentIndex = value;
                  setState(() {});
                },
                children: [
                  CompanyWelcomeStep(
                    pageController: _pageController,
                    userName: 'Jj',
                  ),
                  CompanyDetailsStep(
                    onNameChanged: (value) {},
                  ),
                  CompanyExplicationStep(
                    companyName: 'Companhia',
                    pageController: _pageController,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _currentIndex == 0
                    ? TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                          // ação ao clicar em "Mais tarde"
                        },
                        child: Text(
                          'Criar mais tarde',
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorsPallete.primaryPurple,
                          ),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.linear,
                          );
                        },

                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: ColorsPallete.primaryPurple,
                        ),
                      ),
                Spacer(),
                if (_currentIndex != 2)
                  IconButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    },

                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorsPallete.primaryPurple,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
