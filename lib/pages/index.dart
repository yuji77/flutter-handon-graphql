import 'package:flutter/material.dart';
import 'package:graphql_handson/repositories/github_repository.dart';

class IssueListPage extends StatelessWidget {
  const IssueListPage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: fetchRepositories(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // 通信にエラーが発生した場合
        if (snapshot.hasError) {
          return Center(child: Text('Error : ${snapshot.error}'));
        }

        // 通信に成功も、データが存在しなかった場合
        if (snapshot.data == null) {
          return const Text('No repository');
        }

        // 通信に成功し、無事にデータをフェッチできた場合
        return Center();
      },
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    this.id,
    required this.title,
    required this.message,
    required this.url,
    required this.updatedAt,
  });
  final String? id;
  final String title;
  final String message;
  final String url;
  final String updatedAt;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Text(
              message,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87),
            ),
            Text(
              updatedAt,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
