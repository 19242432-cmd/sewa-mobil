import 'package:flutter/material.dart';

class TombolPesan extends StatelessWidget {
  const TombolPesan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: MediaQuery.of(context).size.width - 2 * 24,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Pesan",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue, width: 3),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
