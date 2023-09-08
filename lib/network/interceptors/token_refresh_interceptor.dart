// class DeviceIdRefreshInterceptor extends InterceptorsWrapper {
//   final TokenBox tokenBox;
//
//   DeviceIdRefreshInterceptor({
//     required this.nexaBox,
//     required this.tokenBox,
//   });
//
//   @override
//   void onError(
//       DioError err,
//       ErrorInterceptorHandler handler,
//       ) async {
//     if (err.response?.statusCode == 408) {
//       // TODO refresh session id
//       logDebug("408 now refresh device id");
//       //We got a device id error
//       final RequestOptions? options = err.response?.requestOptions;
//       // if (options != null) {
//       //   //check if retry count is 1 (retry count gives number of attempt for refresh token renewable
//       //   if (options.headers['Retry-Count'] == 1) {
//       //     //TODO: logout user here
//       //     handler.next(err);
//       //   }
//       //   //request for new refresh token
//       //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
//       //   String id = await FirebaseInstallations.instance.getId();
//       //   try {
//       //     final dio =
//       //         NetworkClient().createDeviceRefreshDio(tokenBox, oneTimeBox);
//       //     final authRepository = AuthRepository(dio: dio);
//       //     final deviceRegistration = await authRepository.deviceRegistration(
//       //       request: DeviceRegistrationRequest(
//       //         deviceIdentifier: id,
//       //         deviceType: Platform.isAndroid ? "mobile-android" : "mobile-ios",
//       //         appVersion: packageInfo.version,
//       //         buildNumber: packageInfo.buildNumber,
//       //       ),
//       //     );
//       //
//       //     options.headers['Retry-Count'] =
//       //         1; //setting retry count to 1 to prevent further concurrent calls
//       //     await tokenBox.saveSessionId(deviceRegistration.deviceId);
//       //
//       //     var response = await dio.request(
//       //       err.requestOptions.path,
//       //       data: err.requestOptions.data,
//       //       queryParameters: err.requestOptions.queryParameters,
//       //       options: Options(
//       //         method: err.requestOptions.method,
//       //         headers: err.requestOptions.headers,
//       //       ),
//       //     );
//       //     return handler.resolve(response);
//       //   } catch (ex) {
//       //     super.onError(err, handler);
//       //   }
//       // } else {
//       //   super.onError(err, handler);
//       // }
//     } else {
//       super.onError(err, handler);
//     }
//   }
// }