import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: const Alignment(0, -0.8),  // Ini akan menempatkan gambar di tengah
            child: Image.asset(
              "assets/images/main2.png",
              width: size.width * 0.35,
            ),
          ),
          child  // Child yang lain tetap akan di-render di atas gambar
        ],
      ),
    );
  }
}