import 'package:flutter/material.dart';
import 'package:hunian_app/core/constants/app_colors.dart';
import 'package:hunian_app/core/constants/app_teks_style.dart';
import 'package:hunian_app/core/widgets/bottom_curve_clipper.dart';
import 'package:hunian_app/core/widgets/custom_button.dart';
import 'package:hunian_app/core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(height: 350, color: AppColors.primaryColor),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 24.0,
                left: 24.0,
                top: 100.0,
                bottom: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in to your account',
                        style: AppTextStyles.heading1.copyWith(
                          color: AppColors.textWhite,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Find your ideal place to live today!',
                        style: AppTextStyles.bodyRegular.copyWith(
                          color: AppColors.textWhite,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  // Form login card
                  Container(
                    width: mediaQuery.size.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            label: 'Email',
                            hintText: 'Enter your email',
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),
                          CustomTextField(
                            label: 'Password',
                            hintText: 'Enter your password',
                            isPassword: true,
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 8) {
                                return 'Password at least 8 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Remember me
                              Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Checkbox(
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value ?? false;
                                        });
                                      },
                                      activeColor: AppColors.primaryColor,
                                      shape: const CircleBorder(),
                                      side: BorderSide(color: AppColors.grey),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Remember me',
                                    style: AppTextStyles.bodySecondary,
                                  ),
                                ],
                              ),

                              // Forgot password
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Forgot password?',
                                  style: AppTextStyles.link,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          CustomButton(
                            text: 'Sign In',
                            isLoading: false,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Login berhasil (dummy)'),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 30),
                          // Divider
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: AppColors.grey,
                                  thickness: 0.5,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Text(
                                  'Or continue with',
                                  style: AppTextStyles.bodySecondary.copyWith(
                                    color: AppColors.grey,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: AppColors.grey,
                                  thickness: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/google_icon.png',
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 40),
                              Image.asset(
                                'assets/icons/facebook_icon.png',
                                width: 40,
                                height: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // navigasi ke halaman Sign Up nanti
                      },
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyles.bodyRegular,
                          children: [
                            const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(color: AppColors.textPrimary),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: AppTextStyles.link.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
