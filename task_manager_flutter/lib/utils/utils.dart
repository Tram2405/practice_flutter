import 'dart:math';

class TMUtils {
  static String memberPicture({int? pictureId}) {
    if (pictureId != null) {
      pictureId %= 6;
    }
    pictureId ??= (Random().nextInt(5));
    return 'assets/images/img_avatar_member_$pictureId.jpg';
  }
}
