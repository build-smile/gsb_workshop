class HttpStatusMsg {
  bool success;
  String? errorMsg;
  Object? result;
  HttpStatusMsg({this.success = true, this.errorMsg, this.result});
}
