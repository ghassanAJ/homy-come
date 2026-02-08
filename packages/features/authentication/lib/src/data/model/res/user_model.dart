import 'child_user.dart';
import 'parent_user.dart';
import 'user_model_base.dart';

export 'child_user.dart';
export 'parent_user.dart';
export 'user_model_base.dart';
export 'user_type.dart';

class UserModelFactory {
  static UserModel fromJson(Map<String, dynamic> json) {
    final userType = json['type'] as String?;

    if (userType == 'child') {
      return ChildUser.fromJson(json);
    }

    return ParentUser.fromJson(json);
  }
}
