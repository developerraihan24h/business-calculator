import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class uiHelper {


  static Widget customTextFormField({
    required TextEditingController controller,
    required String text,
    required bool toHide,
    required TextInputType keyboardType,  // Changed from 'keyboardType' to 'TextInputType'
  }){
    return TextField(
      controller: controller,
      obscureText: toHide,  // Added this to handle password fields
      keyboardType: keyboardType,  // Using the parameter instead of hardcoded TextInputType.number
      decoration: InputDecoration(
        labelText: text,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(
              color: Colors.deepOrange,
              width: 2,
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            )
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            )
        ),
      ),
    );
  }


  static Widget customTextFieldWithsuffixIcon ({required TextEditingController controller,required String text, required bool toHide, IconData? icon, String? keybordTyp, }){

    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      //jodi edit text k disable kora hoi tahole ei ta hobe.
      // enabled: false,
      decoration: InputDecoration(
          labelText: text,
         // hintText: 'email',
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(
                color: Colors.deepOrange,
                width: 2,
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 2,

              )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,

              )
          ),

          suffixIcon: IconButton(
            onPressed: (){

            },
            icon: Icon(icon),
          ),

          prefixIcon: Icon(icon)


      ),
    );


  }


}