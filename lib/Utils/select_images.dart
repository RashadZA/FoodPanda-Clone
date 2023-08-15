part of 'design_utils.dart';

bool get isDarkMode => false;
/// To select which Image/Icon being used in current mode
String setImageMode(
    String lightImageIcon, [
      String? darkImageIcon,
    ]) =>
    darkImageIcon != null && isDarkMode ? darkImageIcon : lightImageIcon;

Image selectImageFromLocal(
    String image, {
      double? width,
      double? height,
      BoxFit fit = BoxFit.cover,
    }) {
  return Image.asset(
    image,
    fit: fit,
    width: width,
    height: height,
  );
}

Widget selectIconFromLocal(
    String icon, {
      double? width,
      Color? color,
      void Function()? onPressed,
    }) {
  return CoreButton(
    onPressed: onPressed,
    child: Image.asset(
      icon,
      width: width,
      color: color,
      height: width,
    ),
  );
}