import 'package:u_learning/common/entities/entities.dart';
import 'package:u_learning/common/utils/http_utils.dart';

class UserApi {
  static login({
    LoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }
}
