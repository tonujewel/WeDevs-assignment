import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String text;

  const CustomButton({Key? key, required this.onTap,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .06,
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Text(
          "$text",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}