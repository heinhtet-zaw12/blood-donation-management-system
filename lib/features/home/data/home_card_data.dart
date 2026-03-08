import 'package:blood_donation_management_system/features/home/model/home_card_model.dart';

const String bloodIcon = "assets/images/blood_icon.svg";

final List<HomeCardModel> homeCardData = [
  HomeCardModel(
    svgPicture: bloodIcon,
    title: "150+",
    description: "Lives Saved",
  ),
  HomeCardModel(
    svgPicture: bloodIcon,
    title: "50+",
    description: "Registered Donors",
  ),
  HomeCardModel(
    svgPicture: bloodIcon,
    title: "60+",
    description: "Active Requests",
  ),
  HomeCardModel(
    svgPicture: bloodIcon,
    title: "60+",
    description: "Blood Donations",
  ),
];
