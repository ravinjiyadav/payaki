import 'package:flutter/material.dart';
import 'package:payaki/modules/auth/changePassword/screen/change_password_screen.dart';
import 'package:payaki/modules/auth/changePassword/viewModel/change_password_screen_vm.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_new_password_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_send_otp_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_success_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/screens/forgot_pass_verify_otp_screen.dart';
import 'package:payaki/modules/auth/forgotPassword/viewModel/forgot_new_pass_vm.dart';
import 'package:payaki/modules/auth/forgotPassword/viewModel/forgot_pass_send_opt_vm.dart';
import 'package:payaki/modules/auth/forgotPassword/viewModel/forgot_pass_verify_otp_vm.dart';
import 'package:payaki/modules/auth/logIn/provider/log_in_with_phone_send_otp_screen_vm.dart';
import 'package:payaki/modules/auth/logIn/provider/login_with_phone_verify_otp_screen_vm.dart';
import 'package:payaki/modules/auth/logIn/screens/log_in_screen.dart';
import 'package:payaki/modules/auth/logIn/screens/login_with_phone_send_otp_screen.dart';
import 'package:payaki/modules/auth/logIn/screens/login_with_phone_verify_otp_screen.dart';
import 'package:payaki/modules/auth/signUp/provider/signup_screen_vm.dart';
import 'package:payaki/modules/auth/signUp/screens/sign_up_screen.dart';
import 'package:payaki/modules/bottomBar/BottomNavigationBarScreen.dart';
import 'package:payaki/modules/chat/screens/web_view_chat_screen.dart';
import 'package:payaki/modules/myCart/screen/my_cart_screen.dart';
import 'package:payaki/modules/myCart/viewModel/my_cart_screen_vm.dart';
import 'package:payaki/modules/postAdd/provider/choose_category_screen_vm.dart';
import 'package:payaki/modules/postAdd/provider/location_vm.dart';
import 'package:payaki/modules/postAdd/provider/sub_category_screen_vm.dart';
import 'package:payaki/modules/postAdd/screens/add_detail_screen.dart';
import 'package:payaki/modules/postAdd/screens/add_location_screen.dart';
import 'package:payaki/modules/postAdd/screens/choose_category_screen.dart';
import 'package:payaki/modules/postAdd/screens/gallery_screen.dart';
import 'package:payaki/modules/postAdd/screens/select_add_type_screen.dart';
import 'package:payaki/modules/postAdd/screens/set_price_screen.dart';
import 'package:payaki/modules/postAdd/screens/sub_category_screen.dart';
import 'package:payaki/modules/postAdd/screens/user_detail_screen.dart';
import 'package:payaki/modules/postDetails/provider/post_detail_screen_vm.dart';
import 'package:payaki/modules/postDetails/screens/post_details_screen.dart';
import 'package:payaki/modules/profile/screens/edit_profile_screen.dart';
import 'package:payaki/modules/profile/viewModel/edit_profile_screen_vm.dart';
import 'package:payaki/modules/reviewAndMail/addReview/screens/add_review_screen.dart';
import 'package:payaki/modules/reviewAndMail/addReview/viewModel/add_review_screen_vm.dart';
import 'package:payaki/modules/reviewAndMail/quote/screen/quote_screen.dart';
import 'package:payaki/modules/reviewAndMail/quote/viewModel/quote_screen_vm.dart';
import 'package:payaki/modules/reviewAndMail/replyEmail/screen/reply_email_screen.dart';
import 'package:payaki/modules/reviewAndMail/replyEmail/viewModel/reply_email_screen_vm.dart';
import 'package:payaki/modules/reviewAndMail/report/screen/report_add_screen.dart';
import 'package:payaki/modules/reviewAndMail/report/viewModel/report_add_screen_vm.dart';
import 'package:payaki/modules/search/providers/search_result_screen_vm.dart';
import 'package:payaki/modules/search/providers/search_screen_vm.dart';
import 'package:payaki/modules/search/screens/search_result_screen.dart';
import 'package:payaki/modules/search/screens/search_screen.dart';
import 'package:payaki/modules/transaction/screens/transaction_detail_screen.dart';
import 'package:payaki/modules/transaction/screens/transaction_screen.dart';
import 'package:payaki/modules/transaction/viewModel/transaction_screen_vm.dart';
import 'package:payaki/modules/welcome/welcome_screen.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:provider/provider.dart';

import '../modules/postDetails/screens/image_view_screen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());

      case RouteName.logInScreen:
        return MaterialPageRoute(builder: (context) => const LogInScreen());

      case RouteName.loginWithPhoneSendOtpScreen:
        return MaterialPageRoute(
            builder: (context) =>
                ChangeNotifierProvider<LoginWithPhoneSendOtpVm>(
                    create: (_) => LoginWithPhoneSendOtpVm(),
                    child: const LoginWithPhoneSendOtpScreen()));

      case RouteName.loginWithPhoneVerifyOtpScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) =>
                ChangeNotifierProvider<LoginWithPhoneVerifyOtpVm>(
                    create: (_) => LoginWithPhoneVerifyOtpVm(),
                    child: LoginWithPhoneVerifyOtpScreen(
                      countryCode: arg["countryCode"],
                      mobile: arg["mobile"],
                    )));

      case RouteName.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<SignUpVm>(
                create: (_) => SignUpVm(), child: const SignUpScreen()));
      case RouteName.forgotPassSendOtpScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => ForgotPassSendOtpVm(),
                  child: const ForgotPassSendOtpScreen(),
                ));
      case RouteName.forgotPassVerifyOtpScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => ForgotPassVerifyOtpVm(),
                  child: ForgotPassVerifyOtpScreen(
                      userId: arg["userId"],
                      countryCode: arg["countryCode"],
                      mobile: arg["mobile"]),
                ));

      case RouteName.forgotNewPasswordScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => ForgotNewPassVm(),
                  child: ForgotNewPasswordScreen(
                    userId: arg["userId"],
                  ),
                ));

      case RouteName.forgotPassSuccessScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPassSuccessScreen());
      case RouteName.bottomNavigationBarScreen:
        return MaterialPageRoute(
            builder: (context) => const BottomNavigationBarScreen());

      case RouteName.chooseCategoryScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => ChooseCategoryScreenVm(),
                  child: const ChooseCategoryScreen(),
                ));

      case RouteName.subCategoryScreen:
        var arg = settings.arguments as Map;

        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => SubCategoryScreenVm(),
                  child: SubCategoryScreen(
                      catId: arg["catId"], catName: arg["catName"]),
                ));

      case RouteName.addDetailScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => AddDetailScreen(
                  catId: arg["catId"],
                  subCatId: arg["subCatId"],
                ));

      case RouteName.setPriceScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => SetPriceScreen(
                  catId: arg["catId"],
                  subCatId: arg["subCatId"],
                  title: arg["title"],
                  tag: arg["tag"],
                  description: arg["description"],
                ));

      case RouteName.galleryScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => GalleryScreen(
                  catId: arg["catId"],
                  subCatId: arg["subCatId"],
                  title: arg["title"],
                  tag: arg["tag"],
                  price: arg["price"],
                  description: arg["description"],
                  negotiate: arg["negotiate"],
                ));
      case RouteName.addLocationScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => LocationVm(),
                  child: AddLocationScreen(
                    catId: arg["catId"],
                    subCatId: arg["subCatId"],
                    title: arg["title"],
                    tag: arg["tag"],
                    price: arg["price"],
                    description: arg["description"],
                    negotiate: arg["negotiate"],
                    selectedImages: arg["selectedImages"],
                  ),
                ));

      case RouteName.selectAddTypeScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => SelectAddTypeScreen(
                  catId: arg["catId"],
                  subCatId: arg["subCatId"],
                  title: arg["title"],
                  tag: arg["tag"],
                  price: arg["price"],
                  description: arg["description"],
                  negotiate: arg["negotiate"],
                  selectedImages: arg["selectedImages"],
                  location: arg["location"],
                  city: arg["city"],
                  country: arg["country"],
                  latlong: arg["latlong"],
                  state: arg["state"],
                  phone: arg["phone"],
                  availableDays: arg["availableDays"],
                ));

      case RouteName.userDetailScreen:
        return MaterialPageRoute(
            builder: (context) => const UserDetailScreen());

      case RouteName.searchScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => SearchScreenVm(),
                  child: const SearchScreen(),
                ));

      case RouteName.searchResultScreen:
        var arg = settings.arguments as Map;

        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => SearchResultScreenVm(),
                  child: SearchResultScreen(
                      initialPostList: arg["initialPostList"],
                      headerTitle: arg["headerTitle"],
                      title: arg["title"],
                      category: arg["category"],
                      location: arg["location"],
                      city: arg["city"],
                      country: arg["country"],
                      state: arg["state"],
                      listingType: arg["listingType"]),
                ));

      case RouteName.postDetailsScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => PostDetailScreenVm(),
                  child: PostDetailsScreen(
                    postId: arg["postId"],
                  ),
                ));
      case RouteName.addReviewScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => AddReviewScreenVm(),
                  child: AddReviewScreen(
                    postId: arg["postId"],
                  ),
                ));

      case RouteName.replyEmailScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => ReplyEmailScreenVm(),
                  child: ReplyEmailScreen(
                      postId: arg["postId"],
                      receiverEmail: arg["receiverEmail"],
                      receiverName: arg["receiverName"],
                      productName: arg["productName"]),
                ));

      case RouteName.editProfileScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => EditProfileScreenVm(),
                  child: EditProfileScreen(
                    userProfile: arg["userProfile"],
                  ),
                ));
      case RouteName.reportAddScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (_) => ReportAddScreenVm(),
                child: ReportAddScreen(postUrl: arg["postUrl"])));

      case RouteName.changePasswordScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (_) => ChangePasswordScreenVm(),
                child: const ChangePasswordScreen()));
      case RouteName.transactionScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (_) => TransactionScreenVm(),
                child: const TransactionScreen()));
      case RouteName.transactionDetailScreen:
        var arg = settings.arguments as Map;

        return MaterialPageRoute(
            builder: (context) => TransactionDetailScreen(
                  transaction: arg["transaction"],
                ));

      case RouteName.quoteScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (_) => QuoteScreenVm(),
                child: QuoteScreen(
                  postId: arg["postId"],
                  postUserId: arg["postUserId"],
                  productName: arg["productName"],
                )));
      case RouteName.imageViewScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => ImageViewScreen(
                  images: arg["images"],
                ));

      case RouteName.webViewChatScreen:
        var arg = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => WebViewChatScreen(
                  url: arg["url"],
                ));
      case RouteName.myCartScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (_) => MyCartScreenVm(), child: const MyCartScreen()));

      default:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
    }
  }
}
