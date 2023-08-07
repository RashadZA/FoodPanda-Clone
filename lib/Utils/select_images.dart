part of 'design_utils.dart';

bool get isDarkMode => false;
/// To select which Image/Icon being used in current mode
String setldImageIcon(
    String lightImageIcon, [
      String? darkImageIcon,
    ]) =>
    darkImageIcon != null && isDarkMode ? darkImageIcon : lightImageIcon;

Image selectImage(
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