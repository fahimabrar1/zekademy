import 'package:zekademy/Util/index_librarby.dart';

class ProfileViewDetail extends StatelessWidget {
  final int index;
  final int peopleId;
  const ProfileViewDetail(
      {required this.index, required this.peopleId, Key? key})
      : super(key: key);

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
            Text(
              "Name",
              style: MyCustomFont.getRobotoStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: MyCustomColor.fontBlack),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const SizedBox(
                    height: 80,
                    width: 80,
                    child: Image(
                      image: AssetImage(
                        'assets/images/Rectangle 21-1.jpg',
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
                        "Name",
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
                        "data",
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
          ),
        ),
      ),
    );
  }
}
