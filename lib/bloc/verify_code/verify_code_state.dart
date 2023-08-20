abstract class VerifyCodeState {}

class InitState extends VerifyCodeState{}

class CodeLoadingState extends VerifyCodeState {}

class CodeSuccessState extends VerifyCodeState {
  String token;
  CodeSuccessState(this.token);
}

class CodeErrorState extends VerifyCodeState {}
