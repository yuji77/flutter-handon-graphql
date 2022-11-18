import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_handson/graphql/graphql.dart';
import 'package:graphql_handson/model/repository.dart';
import 'package:graphql_handson/plugins/graphql_cliant.dart';

Future<List<Repository>?> fetchRepositories() async {
  var response = await client.query(
    QueryOptions(
      document: gql(repositoriesQuery),
    ),
  );
  final List<dynamic>? results =
      response.data?['viewer']?['repositories']?['nodes'];
  final List<Repository> repositoryList =
      results!.map((dynamic item) => Repository.fromJson(item)).toList();
  return repositoryList;
}
