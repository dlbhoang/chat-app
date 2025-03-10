import 'package:connectivity_plus/connectivity_plus.dart';

abstract class Network{
  Future<bool> isConnect();

  Future<List<ConnectivityResult>> get connectivityResult;
  Stream<List<ConnectivityResult>> get onConnectivityChanged;

}

class NetworkInfor implements Network{
  late Connectivity connectivity;

  static final NetworkInfor _network =NetworkInfor._internal(Connectivity());

  factory NetworkInfor(){
    return _network;
  }

  NetworkInfor._internal(this.connectivity){
    connectivity=this.connectivity;
  }

  @override
  Future<bool> isConnect() async{
    final res=await connectivityResult;
    return !res.contains(ConnectivityResult.none);
  }

  @override
  Future<List<ConnectivityResult>> get connectivityResult async{
    return connectivity.checkConnectivity();
  }

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged => connectivity.onConnectivityChanged;
}



class NoInternetException implements Exception{
  late String _message;

  NoInternetException([String mess="Không có internet"]){
    this._message=mess;
  }

  @override
  String toString(){
    return _message;
  }
}