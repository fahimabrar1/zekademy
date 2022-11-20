import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zekademy/Screens/People/Model/people_list_model.dart';
import 'package:zekademy/Screens/People/Profile%20View/profile_view.dart';
import 'package:zekademy/Util/global_varaibles.dart';
import 'package:zekademy/Util/index_librarby.dart';

class PeopleListViewPanel extends StatelessWidget {
  final int index;
  final PeopleListModel peopleListModel;
  const PeopleListViewPanel(
      {required this.index, required this.peopleListModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 72,
            margin: EdgeInsets.only(
                top: (index == 0) ? 16 : 14,
                left: 14,
                right: 14,
                bottom: (index == 10 - 1) ? 16 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MyCustomColor.greyBorder),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.amber,
                  height: 72,
                  padding: const EdgeInsets.all(8),

                  child: Image.asset(peopleImages[(index + 1) % 8]),
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      peopleListModel.name,
                      style: MyCustomFont.getRobotoStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: MyCustomColor.fontBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text("@${peopleListModel.username}",
                        style: MyCustomFont.getRobotoStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: MyCustomColor.grey,
                        )),
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: MyCustomColor.greyBorder),
                  ),
                  child: InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: ProfileViewDetail(
                            index: index, peopleId: peopleListModel.id),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        // pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 7),
                      child: Text(
                        "View",
                        style: MyCustomFont.getRobotoStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: MyCustomColor.purple,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

///
/// PeopleListView Shimmer panels
///
class PeopleListViewShimmerPanel extends StatelessWidget {
  final int index;
  const PeopleListViewShimmerPanel({required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 72,
            margin: EdgeInsets.only(
                top: (index == 0) ? 16 : 14,
                left: 14,
                right: 14,
                bottom: (index == 10 - 1) ? 16 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MyCustomColor.greyBorder),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    // color: Colors.amber,
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 100,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 70,
                        height: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 60,
                    height: 30,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: MyCustomColor.greyBorder),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
