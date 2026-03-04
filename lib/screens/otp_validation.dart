import 'dart:async';
import 'package:airbnb_basic_screens/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpValidation extends StatefulWidget {
  final String phoneNumber;

  const OtpValidation({super.key, required this.phoneNumber});

  @override
  State<OtpValidation> createState() => _OtpValidationScreenState();
}

class _OtpValidationScreenState extends State<OtpValidation> {
  final TextEditingController otpController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  bool showResendText = false;
  bool showLoader = false;
  bool isVerifying = false;
  bool hasSubmitted = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      focusNode.requestFocus();
    });

    otpController.addListener(handleOtpChange);
  }

  void handleOtpChange() {
    setState(() {
      showResendText = otpController.text.isNotEmpty;
    });

    if (otpController.text.length == 6 && !isVerifying) {
      isVerifying = true;

      startVerification();
    }
  }

  Future<void> startVerification() async {
    FocusScope.of(context).unfocus();

    setState(() {
      showLoader = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      try {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
          (_) => false,
        );
      } catch (e) {
        debugPrint('Navigation error: $e');
      }
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String otp = otpController.text;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new, color: Color(0xff007AFF)),
                      SizedBox(width: 4),
                      Text(
                        "Back",
                        style: GoogleFonts.inter(
                          color: Color(0xff007AFF),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Image.asset('assets/icons/vector.png', width: 40, height: 40),

                  const SizedBox(height: 15),

                  Text(
                    "Enter code",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1A1C29),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Your temporary login code was sent to:",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff797979),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "+91 ${widget.phoneNumber}",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff1A1C29),
                    ),
                  ),

                  const SizedBox(height: 25),

                  GestureDetector(
                    onTap: () => focusNode.requestFocus(),
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0,
                          child: TextField(
                            controller: otpController,
                            focusNode: focusNode,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            onChanged: (value) {
                              setState(() {
                                showResendText = value.isNotEmpty;
                              });

                              if (value.length == 6 && !hasSubmitted) {
                                hasSubmitted = true;

                                Future.microtask(() {
                                  startVerification();
                                });
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(6, (index) {
                            bool filled = index < otp.length;

                            return Container(
                              width: 48.83,
                              height: 62,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xffF3F4F6),
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(
                                  color: filled
                                      ? Color(0xff007AFF)
                                      : Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                              child: Text(
                                filled ? otp[index] : "○",
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  if (showResendText)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive a code? ",
                          style: GoogleFonts.inter(
                            color: Color(0xff797979),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          "Send again",
                          style: GoogleFonts.inter(
                            color: Color(0xff007AFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                  const Spacer(),
                ],
              ),
            ),
          ),

          if (showLoader)
            Container(
              color: Colors.white.withValues(alpha: 0.8),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color(0xff4166F5)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
