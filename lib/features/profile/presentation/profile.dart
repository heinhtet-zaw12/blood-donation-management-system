import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffE6DADA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.favorite, color: Color(0xffFF2D3D)),
                      SizedBox(width: 6),
                      Text(
                        "Bloodlife",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFF2D3D),
                        ),
                      )
                    ],
                  ),

                  Icon(Icons.menu, color: Colors.brown)
                ],
              ),

              const SizedBox(height: 30),

              /// PROFILE CARD
              _card(
                child: Column(
                  children: [

                    /// Avatar
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [

                        const CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(
                              "https://i.pravatar.cc/150?img=3"),
                        ),

                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFF2D3D),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "User Name : Zar Ni",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6B0000),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "User ID : 000255",
                      style: TextStyle(color: Color(0xff6B0000)),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "Blood-type : B+",
                      style: TextStyle(color: Color(0xff6B0000)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// DONATION INFO
              _card(
                child: Column(
                  children: const [

                    Text("Last Donation : 28 Jan 2026"),
                    SizedBox(height: 8),

                    Text("Birth of Date : 14 Feb 2025"),
                    SizedBox(height: 8),

                    Text("Weight : 86 kg"),
                    SizedBox(height: 8),

                    Text("Last blood pressure : 120/80 mmHg"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// CONTACT CARD
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text("Address"),

                    const SizedBox(height: 12),

                    Row(
                      children: [

                        Expanded(
                          child: _dropdownBox("None"),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: _dropdownBox("Male"),
                        )
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text("Phone Number"),

                    const SizedBox(height: 10),

                    _inputBox("+959 987654"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// MEDICAL CARD
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text("Allergies"),

                    const SizedBox(height: 10),

                    _inputBox("Seafood"),

                    const SizedBox(height: 20),

                    const Text("Current Medications"),

                    const SizedBox(height: 10),

                    _inputBox("I am taking cough medicine."),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /// CARD STYLE
  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: const [
          BoxShadow(
            color: Color(0x33FF2D3D),
            blurRadius: 12,
            offset: Offset(0, 6),
          )
        ],
      ),

      child: child,
    );
  }

  /// INPUT BOX
  Widget _inputBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),

      decoration: BoxDecoration(
        color: const Color(0xffEFE4E4),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(Icons.edit, color: Color(0xffFF2D3D), size: 18)
        ],
      ),
    );
  }

  /// DROPDOWN STYLE BOX
  Widget _dropdownBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),

      decoration: BoxDecoration(
        color: const Color(0xffEFE4E4),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(Icons.arrow_drop_down, color: Color(0xffFF2D3D))
        ],
      ),
    );
  }
}