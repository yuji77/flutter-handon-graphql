import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_handson/plugins/graphql_cliant.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final clientValue = ValueNotifier<GraphQLClient>(
      client,
    );

    return GraphQLProvider(
      client: clientValue,
      child: child,
    );
  }
}