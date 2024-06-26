
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../utils/app_colors.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.textEditingController,
    this.focusNode,
    this.labelText,
    this.label,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.cursorColor = AppColors.blackNormal,
    this.inputTextStyle,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.fillColor = Colors.white,
    this.suffixIcon,
    this.onChanged,
    this.suffixIconColor,
    this.fieldBorderRadius = 8,
    this.fieldBorderColor = AppColors.greenNormal ,
    this.isPassword = false,
    this.readOnly = false,
    super.key,
    this.isPrefixIcon = false,
    this.focusBorderColor = AppColors.greenNormal,
    this.onTap,
    this.icon,
    this.maxLength,
    this.inputFormatters,
    this.onSubmit
  });

  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color cursorColor;
  final TextStyle? inputTextStyle;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;
  final String ? labelText;
  final String ?label;
  final FormFieldValidator? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final double fieldBorderRadius;
  final Color fieldBorderColor;
  final Color focusBorderColor;
  final void Function(String)? onChanged;
  final bool isPassword;
  final bool isPrefixIcon;

  final bool readOnly;
  final Widget ? icon;
  final List <TextInputFormatter> ?inputFormatters;
  final int ?maxLength;
  final VoidCallback ? onTap;
  final void Function(String)? onSubmit;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      onFieldSubmitted: widget.onSubmit,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: widget.readOnly,
      controller: widget.textEditingController,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      cursorColor: widget.cursorColor,
      style: GoogleFonts.roboto(
        color:const Color(0xff333333),
        fontSize: 14,
        fontWeight: FontWeight.w400,

      ),
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? obscureText : false,
      validator: widget.validator,
      decoration: InputDecoration(
        errorMaxLines: 2,
        counterText: "",
        hintText: widget.hintText,
        hintStyle: GoogleFonts.roboto (
            color: AppColors.blackLightActive,
            fontWeight: FontWeight.w300,

            fontSize: 14),
        fillColor: widget.fillColor,
        filled: true,
        labelText:widget.labelText ,
        floatingLabelStyle:  const TextStyle(color: AppColors.greenNormal),
        labelStyle:   const TextStyle(color: AppColors.blackLight,fontSize: 14.0,fontWeight: FontWeight.w400),
        prefixIcon: widget.isPrefixIcon
            ?  widget.icon
            : null,
        suffixIcon: widget.isPassword
            ? GestureDetector(
            onTap: toggle,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 16, vertical: 14),
              child: obscureText
                  ?  const Icon(
                Icons.visibility_off_outlined,
                color: AppColors.blackLight,
              )
                  : const Icon(Icons.visibility_outlined,
                  color: AppColors.blackLight),
            ))
            : widget.suffixIcon,
        suffixIconColor: widget.suffixIconColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
            borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
            gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
            borderSide: BorderSide(color: widget.focusBorderColor, width: 1),
            gapPadding: 0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
            borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
            gapPadding: 0),
      ),



    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
