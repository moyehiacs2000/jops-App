import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';
import '../firebase/models/firebase_job_model.dart';
import 'job_card.dart';

class SearchContent extends StatefulWidget {
  final List<FirebaseJobModel> itemsData;
  final UserModel user;
  const SearchContent(this.itemsData, this.user, {Key key}) : super(key: key);

  @override
  State<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ScrollController _scrollController = ScrollController();
  bool isLoading = true,
      isSearching = false,
      hasModelData = true,
      isLoading1 = false;
  DocumentSnapshot lastDecument;
  int decumentLimit = 7;
  @override
  void initState() {
    super.initState();
    getPaginedData();
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;
      if (maxScroll - currentScroll <= delta) {
        getPaginedData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Expanded(
            child: Center(
              child: Text("Loading..."),
            ),
          )
        : Container(
            child: widget.itemsData.length == 0
                ? Center(
                    child: Text("No Jobs to show"),
                  )
                : Flexible(
                    child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: widget.itemsData.length + 1,
                          itemBuilder: (BuildContext ctx, int index) {
                            return index < widget.itemsData.length
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                            horizontal: 30)
                                        .copyWith(
                                      top: index == 0 ? 20 : 0,
                                      bottom: 20,
                                    ),
                                    child: JopCard2(
                                        widget.itemsData[index], widget.user),
                                  )
                                : hasModelData
                                    ? Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      )
                                    : SizedBox();
                          }),
                    ),
                  ));
  }

  void getPaginedData() async {
    if (hasModelData) {
      if (!isLoading1) {
        await getJobs();
      }
    }
  }

  Future<void> getJobs() async {
    if (lastDecument == null) {
      await _firestore
          .collection("job")
          .limit(decumentLimit + widget.user.appliedJobs.length)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          if (!widget.user.appliedJobs.contains(element.id)) {
            widget.itemsData
                .add(FirebaseJobModel.fromMap(element.data(), element.id));
          }
        });
        lastDecument = value.docs.last;
        if (value.docs.length < decumentLimit) {
          setState(() {
            hasModelData = false;
          });
        }
      });
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading1 = true;
      });
      try {
        await _firestore
            .collection("job")
            .startAfterDocument(lastDecument)
            .limit(decumentLimit)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            if (!widget.user.appliedJobs.contains(element.id)) {
              widget.itemsData
                  .add(FirebaseJobModel.fromMap(element.data(), element.id));
            }
          });
          setState(() {
            isLoading1 = false;
          });
          lastDecument = value.docs.last;
          if (value.docs.length < decumentLimit) {
            setState(() {
              hasModelData = false;
            });
          }
        });
      } catch (e) {
        setState(() {
          isLoading1 = false;
          hasModelData = false;
        });
      }
    }
  }
}
