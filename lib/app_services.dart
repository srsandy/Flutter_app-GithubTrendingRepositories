import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter_api/repo_modal.dart';

final String url = "https://github-trending-api.now.sh/developers?language=java&since=daily";

var header = {
  HttpHeaders.contentTypeHeader : 'application/json',
};

Future<List<RepoList>> getRepositories() async {

  final res = await http.get(url,
    headers: header
  );

  print("hey" + res.statusCode.toString());
  return repoListFromJson(res.body);
}
