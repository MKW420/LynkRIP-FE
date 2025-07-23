import 'package:flutter/material.dart';
import 'package:lynkripe_v1/constants.dart';

class Header extends StatelessWidget implements PreferredSizeWidget
{
     const Header({super.key});
     

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Image.asset('assets/logo.png', height: 150),
      );
  }
    @override
   Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  
}