import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class UnVerifiedEmail extends AuthenticationState {
  final authService;

  UnVerifiedEmail({required this.authService}) {
    // Get.put<VerifyEmailController>(
    //     VerifyEmailController(authService: authService));
  }
}

// class Authenticated extends AuthenticationState {
//   final User user;
//
//   Authenticated({required this.user}) {
//     Get.put<HomeController>(Get.put<HomeController>(HomeController()));
//   }
//
//   @override
//   List<Object> get props => [user];
// }

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
