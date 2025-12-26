class AppConstants {
  static RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static RegExp phoneRegExp = RegExp(r'^\+\d{1,3}\d{6,12}$');
  static double minBudget = 1;
  static double maxBudget = 500;
  static int maxVideoMbSize = 100;
  static int maxVideoBytesSize = 104857600;
  // static TextStyle fieldStyle = TextStyle(
  //   fontSize: AppCommonSizes.fieldFontSize(),
  //   fontWeight: FontWeight.w400,
  // );
  // static InputDecoration simpleTextFieldDecoration = InputDecoration(
  //   filled: true,
  //   contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
  //   hintStyle: fieldStyle,

  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(appBorderRadius),
  //     borderSide: BorderSide(color: AppColors.textFieldBorder, width: 1),
  //   ),
  //   enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(appBorderRadius),
  //     borderSide: BorderSide(color: AppColors.textFieldBorder, width: 1),
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(appBorderRadius),
  //     borderSide: BorderSide(color: AppColors.textFieldBorder, width: 1),
  //   ),
  // );
  // static BoxShadow boxShadow = BoxShadow(
  //   color: AppColors.primaryColor.withValues(alpha: 0.3),
  //   blurRadius: 8,
  //   offset: const Offset(0, 2),
  // );

  static const List<String> imageFormats = [
    '.jpeg?',
    '.jpg?',
    '.png?',
    '.gif?',
    '.bmp?',
    '.webp?',
    '.heif?',
    '.heic?',
    '.tiff?',
    '.webp?',
    '.jpeg',
    '.jpg',
    '.png',
    '.gif',
    '.bmp',
    '.webp',
    '.heif',
    '.heic',
    '.tiff',
    '.webp',
  ];

  static const List<String> videoFormats = [
    '.mp4?',
    '.mov?',
    '.avi?',
    '.mkv?',
    '.webm?',
    '.flv?',
    '.wmv?',
    '.mpg?',
    '.mpeg?',
    '.3gp?',
    '.hevc?',
    '.heif?',
  ];
}
