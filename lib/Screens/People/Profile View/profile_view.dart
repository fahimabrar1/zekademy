import 'dart:developer';

import 'package:shimmer/shimmer.dart';
import 'package:zekademy/Screens/People/Profile%20View/Model/people_model.dart';
import 'package:zekademy/Util/global_varaibles.dart';
import 'package:zekademy/Util/index_librarby.dart';

class ProfileViewDetail extends StatefulWidget {
  final int index;
  final int peopleId;
  const ProfileViewDetail(
      {required this.index, required this.peopleId, Key? key})
      : super(key: key);

  @override
  State<ProfileViewDetail> createState() => _ProfileViewDetailState();
}

class _ProfileViewDetailState extends State<ProfileViewDetail> {
  late Future<PeopleModel?> peopleDetailFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    peopleDetailFuture = getPeoplDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: MyCustomColor.fontBlack,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<PeopleModel?>(
              future: peopleDetailFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!.name,
                    style: MyCustomFont.getRobotoStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: MyCustomColor.fontBlack),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 20,
                      width: 50,
                      color: Colors.white,
                    ),
                  );
                } else {
                  return Text(
                    "Go Back",
                    style: MyCustomFont.getRobotoStyle(
                        fontSize: 14, color: MyCustomColor.grey),
                  );
                }
              },
            ),
          ],
        ),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 14,
          ),
          child: FutureBuilder<PeopleModel?>(
            future: peopleDetailFuture,
            builder: (context, snapshot) {
              log(snapshot.data.toString());
              if (snapshot != null) {
                {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image(
                                image: AssetImage(
                                  peopleImages[(widget.index + 1) % 8],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.name,
                                  style: MyCustomFont.getRobotoStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: MyCustomColor.fontBlack,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "@${snapshot.data!.username}",
                                  style: MyCustomFont.getRobotoStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: MyCustomColor.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text(
                              "Email: ",
                              style: MyCustomFont.getRobotoStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyCustomColor.grey,
                              ),
                            ),
                            Text(
                              snapshot.data!.email,
                              style: MyCustomFont.getRobotoStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyCustomColor.fontBlack,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address: ",
                              style: MyCustomFont.getRobotoStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyCustomColor.grey,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "${snapshot.data!.address.street}, ${snapshot.data!.address.suite}, ${snapshot.data!.address.city}, ${snapshot.data!.address.zipcode}",
                                overflow: TextOverflow.fade,
                                style: MyCustomFont.getRobotoStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: MyCustomColor.fontBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phone: ",
                              style: MyCustomFont.getRobotoStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyCustomColor.grey,
                              ),
                            ),
                            Text(
                              snapshot.data!.phone,
                              style: MyCustomFont.getRobotoStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyCustomColor.fontBlack,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "Website: ",
                              style: MyCustomFont.getRobotoStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyCustomColor.grey,
                              ),
                            ),
                            Text(
                              snapshot.data!.website,
                              style: MyCustomFont.getRobotoStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyCustomColor.fontBlack,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    width: 100,
                                    height: 30,
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
                                    width: 60,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 150,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 150,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 150,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 150,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    );
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
                }
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: Image(
                            image: AssetImage(
                              peopleImages[(widget.index + 1) % 8],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.name,
                              style: MyCustomFont.getRobotoStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: MyCustomColor.fontBlack,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              snapshot.data!.username,
                              style: MyCustomFont.getRobotoStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: MyCustomColor.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "Email: ",
                          style: MyCustomFont.getRobotoStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyCustomColor.grey,
                          ),
                        ),
                        Text(
                          "Name",
                          style: MyCustomFont.getRobotoStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyCustomColor.fontBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "Address: ",
                          style: MyCustomFont.getRobotoStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyCustomColor.grey,
                          ),
                        ),
                        Text(
                          "Name",
                          style: MyCustomFont.getRobotoStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyCustomColor.fontBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "Phone: ",
                          style: MyCustomFont.getRobotoStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyCustomColor.grey,
                          ),
                        ),
                        Text(
                          "Name",
                          style: MyCustomFont.getRobotoStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyCustomColor.fontBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "Website: ",
                          style: MyCustomFont.getRobotoStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyCustomColor.grey,
                          ),
                        ),
                        Text(
                          "Name",
                          style: MyCustomFont.getRobotoStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MyCustomColor.fontBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                );

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
      ),
    );
  }

  Future<PeopleModel?> getPeoplDetail() async {
    return await PeopleModel.fetchPeopleDetail(widget.peopleId);
  }
}

///
/// PeopleListView Shimmer panels
///
class ProfileViewDetailShimmer extends StatelessWidget {
  const ProfileViewDetailShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
