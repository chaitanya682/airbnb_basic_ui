import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import './otp_validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  bool isValidNumber = false;

  void validatePhone() {
    setState(() {
      isValidNumber = phoneController.text.length == 10;
    });
  }

  @override
  void initState() {
    super.initState();
    phoneController.addListener(validatePhone);
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 28,
                child: isValidNumber
                    ? GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 23,
                              color: Color(0xff007AFF),
                            ),

                            SizedBox(width: 2),

                            Text(
                              "Back",
                              style: GoogleFonts.inter(
                                color: Color(0xff007AFF),
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),

              const SizedBox(height: 30),

              Image.asset('assets/icons/frame.png', width: 40, height: 40),

              const SizedBox(height: 20),

              Text(
                "Your phone number",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff1A1C29),
                  // shadows: [
                  //   Shadow(
                  //     color: const Color(0xff000000).withValues(alpha: 0.25),
                  //     offset: const Offset(0, 4),
                  //     blurRadius: 4,
                  //   ),
                  // ],
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "It’s helpful to provide a good reason "
                "for why the phone number is required.",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: const Color(0xff797979),
                  fontWeight: FontWeight.normal,
                ),
              ),

              const SizedBox(height: 24),

              Container(
                height: 54,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [Color(0xff00B4EA), Color(0xff8A00FF)],
                    ),
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      "+91",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(width: 3),

                    Expanded(
                      child: TextField(
                        controller: phoneController,

                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],

                        decoration: const InputDecoration(
                          isCollapsed: true,
                          border: InputBorder.none,
                          hintText: "1234567890",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              GestureDetector(
                onTap: isValidNumber
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OtpValidation(
                              phoneNumber: phoneController.text,
                            ),
                          ),
                        );
                      }
                    : null,
                child: Container(
                  height: 55,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: isValidNumber
                        ? const LinearGradient(
                            colors: [Color(0xFF00B4EA), Color(0xFF8A00FF)],
                          )
                        : null,
                    color: isValidNumber ? null : Colors.grey.shade300,
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isValidNumber ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
