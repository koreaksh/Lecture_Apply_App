import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shinhanapp/provider/IdPwFindProvider.dart';
import 'package:shinhanapp/screen_widget/pw_find_body.dart';

import 'id_find_body.dart';

class IdPwFindBody extends StatelessWidget {
  const IdPwFindBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드 : IdPwFindBody");
    IdPwFindProvider idPwFindProvider = context.watch();

    return idPwFindProvider.idPwChoice == true ? IdFindBody() : PwFindBody();
  }
}