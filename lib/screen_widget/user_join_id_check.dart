import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/id_check_provider.dart';

class UserJoinIdCheck extends StatefulWidget {
  const UserJoinIdCheck({Key? key}) : super(key: key);

  @override
  State<UserJoinIdCheck> createState() => _UserJoinIdCheckState();
}

class _UserJoinIdCheckState extends State<UserJoinIdCheck> {
  late IdCheckProvider _idCheckProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _idCheckProvider = context.watch();
  }

  @override
  Widget build(BuildContext context) {
    print("빌드 : user_join_id_check");
    String? status = _idCheckProvider.idCheck?.getStatusCode();
    if(!_idCheckProvider.check) return const Text("중복확인이 필요합니다.", style: TextStyle(color: Colors.red),);
    if(status == "200") return Text(_idCheckProvider.idCheck!.getMessage(), style: const TextStyle(color: Colors.green),);
    if(status != "200" && status != null) return Text(_idCheckProvider.idCheck!.getMessage(), style: const TextStyle(color: Colors.red),);
    return const Text("");
  }
}
