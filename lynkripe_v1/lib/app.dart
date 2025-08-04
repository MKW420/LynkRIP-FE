import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart' hide RouterConfig;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lynkripe_v1/pages/app_view.dart';
import 'package:lynkripe_v1/routes/routing.dart';
import 'package:lynkripe_v1/services/deeplink/deep_link_service.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatefulWidget {
  final UserRepositiory userRepositiory;
  final Uri? intialUri;

  const MyApp( this.userRepositiory, {super.key, this.intialUri});

  @override
  State<MyApp> createState() => DeepLinkService();
}
