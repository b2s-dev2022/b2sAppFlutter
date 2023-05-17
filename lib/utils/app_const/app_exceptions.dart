class AppExceptions implements Exception{
  final _msg, _prifix;
  AppExceptions([this._msg, this._prifix]);
  String toString(){
    return '$_msg $_prifix';
  }
}

class InternetException extends AppExceptions{
  InternetException([String? msg]) : super(msg, 'No internet');
}

class ReqTimeOutException extends AppExceptions{
  ReqTimeOutException([String? msg]) : super(msg, 'Request timeout');
}

class ServerException extends AppExceptions{
  ServerException([String? msg]) : super(msg, 'Internal server err');
}

class InvalidUrlException extends AppExceptions{
  InvalidUrlException([String? msg]) : super(msg, 'Invalid url');
}

class FetchDatException extends AppExceptions{
  FetchDatException([String? msg]) : super(msg, 'Error while communication');
}