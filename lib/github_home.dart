import 'package:flutter/material.dart';
import 'package:flutter_api/app_services.dart';
import 'package:flutter_api/repo_modal.dart';

class GithubHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        elevation: 0.0,
        title: Text('Trending Repositories'),
      ),
      body: FutureBuilder(
        future: getRepositories(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => RepoCard(repoList: snapshot.data[index]),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
      backgroundColor: Colors.grey[400],

    );
  }
}

class RepoCard extends StatelessWidget {

  final RepoList repoList;

  RepoCard({
    @required this.repoList
  });

  _getAvatar() {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      backgroundImage: NetworkImage(repoList.avatar),
    );
  }

  _getRepoInfo() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.blueGrey[800],
                fontSize: 16.0,
              ),
              children: <TextSpan>[
                TextSpan(text: "${repoList.username}/",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                ),
                TextSpan(text: repoList.repo.name),
              ]
            ),
          ),
          Text(repoList.repo.description)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getAvatar(),
            SizedBox(width: 10.0,),
            _getRepoInfo()
          ],
        ),
      ),
    );
  }

}