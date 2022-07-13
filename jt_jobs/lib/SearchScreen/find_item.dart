import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jt_jobs/SearchScreen/job_card.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';

import '../firebase/models/firebase_job_model.dart';

class FindItem extends SearchDelegate {
  UserModel user;
  FindItem({@required this.user});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return query != ''
        ? StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('job')
                .where(
                  "title",
                  isGreaterThanOrEqualTo: query,
                )
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              final docs = snapshot.data.docs;
              List<FirebaseJobModel> results = [];
              for (var element in docs) {
                results
                    .add(FirebaseJobModel.fromMap(element.data(), element.id));
              }
              print(results.length);
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return results[index].title.contains(query)
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30)
                              .copyWith(
                            top: index == 0 ? 20 : 0,
                            bottom: 20,
                          ),
                          child: JopCard2(results[index], user),
                        )
                      : SizedBox();
                },
              );
            },
          )
        : SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox();
  }
}
