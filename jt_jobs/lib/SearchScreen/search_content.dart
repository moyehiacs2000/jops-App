import 'package:flutter/material.dart';
import 'package:jt_jobs/api/models/api_jop.dart';

import 'job_card.dart';

class SearchContent extends StatelessWidget {
  final List<JobsResult> jobsList;
  const SearchContent(this.jobsList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
              children: jobsList
                  .asMap()
                  .entries
                  .map(
                    (item) => Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 30).copyWith(
                        top: item.key == 0 ? 20 : 0,
                        bottom: 20,
                      ),
                      child: JopCard2(item.value),
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
