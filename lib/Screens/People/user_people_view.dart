import 'dart:developer';

import 'package:zekademy/Screens/People/Components/people_list_panel.dart';
import 'package:zekademy/Screens/People/Model/people_list_model.dart';
import 'package:zekademy/Util/index_librarby.dart';

class UserPeoplePageView extends StatefulWidget {
  const UserPeoplePageView({super.key});

  @override
  State<UserPeoplePageView> createState() => _UserPeoplePageViewState();
}

class _UserPeoplePageViewState extends State<UserPeoplePageView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<PeopleListModel>?>(
            future: getPeoplList(),
            builder: (context, snapshot) {
              log("Connection Status: " + snapshot.connectionState.name);

              if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PeopleListViewPanel(
                        index: index,
                        peopleListModel: snapshot.data![index],
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView.builder(
                    itemCount: 50,
                    itemBuilder: (BuildContext context, int index) {
                      return PeopleListViewShimmerPanel(index: index);
                    });
              } else {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_amber,
                        size: 72,
                        color: MyCustomColor.purple,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sorry, an unexpected error occured!!",
                        style: MyCustomFont.getRobotoStyle(
                            fontSize: 14, color: MyCustomColor.grey),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Future<List<PeopleListModel>?> getPeoplList() async {
    return await PeopleListModel.fetchPeopleList();
  }
}
