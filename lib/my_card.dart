import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class MyCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final int input;
  final int inputMax;
  final Color progressColor;
  final Color backgroundColor;
  const MyCard(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.backgroundColor,
      required this.inputMax,
      required this.input,
      required this.progressColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 160,
          height: 160,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25),
                          blurStyle: BlurStyle.outer,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      icon,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.black)
                    .copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.black)
                    .copyWith(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: LinearProgressBar(
                  maxSteps: inputMax,
                  progressType: LinearProgressBar
                      .progressTypeLinear, // Use Linear progress
                  currentStep: input,
                  progressColor: progressColor,
                  backgroundColor: backgroundColor,
                ),
              )
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
