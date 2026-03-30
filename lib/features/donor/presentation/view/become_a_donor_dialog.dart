import 'package:blood_donation_management_system/core/widgets/elevated_button_widget.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme_getter.dart';
import '../../../../core/widgets/input_decoration.dart';

class BecomeDonorDialog extends StatefulWidget {
  const BecomeDonorDialog({super.key});

  @override
  State<BecomeDonorDialog> createState() => _BecomeDonorDialogState();
}

class _BecomeDonorDialogState extends State<BecomeDonorDialog> {
  String? _selectedGender ;
  List<String> gender = ['Male','Female','Other'];
  final TextEditingController _dobController = TextEditingController();
  DateTime? _selectedDate;
  final TextEditingController _lastDonationController = TextEditingController();

  String? selectedValue;
  String? selectedBloodType;
  List<String> bloodType = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String? _nrcNo = '';
  String? _dateOfBirth;
  String? _gender;
  String? _selectedBloodGroup;
  String? _weight;
  String? _lastDonationDate;
  String? _medicalRemark;
  final _formKey =  GlobalKey<FormState>();

@override
  Widget build(BuildContext context) {


    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    Future<void> _pickDate(
        BuildContext context,
        TextEditingController controller,
        {bool isDOB = false}) async {
      DateTime initialLastDate = DateTime.now();
      if (isDOB) {
        initialLastDate = DateTime(
          DateTime.now().year - 18,
          DateTime.now().month,
          DateTime.now().day,
        );
      }

      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: isDOB ? initialLastDate : DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: isDOB ? initialLastDate : DateTime.now(),
        helpText: isDOB ? "Select Date of Birth (Min 18 Years)" : "Select Last Donation Date",
      );

      if (picked != null) {
        setState(() {
          controller.text = "${picked.day}/${picked.month}/${picked.year}";
        });
      }
    }


    return Dialog(
      backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key:  _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Register", style: textTheme.subTitle.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  _buildSectionHeader("PERSONAL IDENTITY", colorScheme.primary),
                  const SizedBox(height: 16),
                  buildLabel("NRC Number", customColors.darkPrimary!, textTheme),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: buildInputDecoration(
                      context: context,
                      hintText: "12/MAMAMANA(N)12345",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "NRC is required";
                      }
                      return null;
                    },
                    onSaved:(v){
                      _nrcNo = v;
                    } ,
                  ),

                  //Date of Birth
                  const SizedBox(height: 20),
                  buildLabel("Date of Birth", customColors.darkPrimary!, textTheme),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _dobController,
                    readOnly: true,
                    onTap: () => _pickDate(context, _dobController, isDOB: true),
                    decoration: buildInputDecoration(
                      context: context,
                      hintText: "DD/MM/YYYY",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Date of Birth is required";
                      }
                      return null;
                    },
                    onSaved: (value) {
                    _dateOfBirth = value;
                    },
                  ),

                  //Gender
                  SizedBox(height: 10,),
                  buildLabel("Gender", customColors.darkPrimary!, textTheme),
                  SizedBox(height: 10,),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedGender,
                    hint: const Text('Select Gender'),
                    icon: Icon(Icons.expand_more, color: Colors.grey.shade500),
                    decoration: InputDecoration(
                      errorStyle: textTheme.tabText.copyWith(color: colorScheme.error),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      filled: true,
                      fillColor: Color(0xFFFEF0EF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: gender.map((String condition) {
                      return DropdownMenuItem<String>(
                        value: condition,
                        child: Text(condition, style: const TextStyle(fontSize: 16)),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Gender is required";
                      }
                      return null;
                    },
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGender= newValue;
                      });

                    },
                    onSaved: (value){
                      _selectedGender = value;
                    },
                  ),

                  //Medical Profile
                  SizedBox(height: 30,),
                  _buildSectionHeader("Medical Profile", colorScheme.primary),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            buildLabel("Blood Group", customColors.darkPrimary!, textTheme),
                            SizedBox(height: 10,),
                            DropdownButtonFormField<String>(
                              isExpanded: true,
                              initialValue:selectedBloodType,
                              hint: const Text('Select'),
                              decoration: InputDecoration(
                                errorStyle: textTheme.tabText.copyWith(color: colorScheme.error),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                filled: true,
                                fillColor: Color(0xFFFEF0EF),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              items: bloodType.map((String condition) {
                                return DropdownMenuItem<String>(
                                  value: condition,
                                  child: Text(condition, style: const TextStyle(fontSize: 16)),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedBloodGroup  = newValue;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Blood Group is required";
                                }
                                return null;
                              },
                              onSaved: (value){
                                _selectedBloodGroup = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            buildLabel("Weight(Kg)", customColors.darkPrimary!, textTheme),
                            SizedBox(height: 10,),
                            TextFormField(
                              decoration: buildInputDecoration(
                                context: context,
                                hintText: "0.00",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "weight is required";
                                }
                                return null;
                              },
                              onSaved: (value){
                                _weight = value;
                              },
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),

                  // Last Donation Date
                  const SizedBox(height: 20),
                  buildLabel("Last Donation Date (optional)", customColors.darkPrimary!, textTheme),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _lastDonationController,
                    readOnly: true,
                    onTap: () => _pickDate(context, _lastDonationController),
                    decoration: buildInputDecoration(
                      context: context,
                      hintText: "DD/MM/YYYY",
                    ),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value){
                      _lastDonationDate = value;
                    },
                  ),

                  //Medical Remark Date
                  SizedBox(height: 20,),
                  buildLabel("Medical Remark (optional)", customColors.darkPrimary!, textTheme),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: buildInputDecoration(
                      context: context,
                      hintText: "Any allergies or current medications",
                    ),
                  onSaved: (value){
                      _medicalRemark = value;
                  },
                  ),

                  SizedBox(height: 30,),

                  //Register Button
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child:  ElevatedButtonWidget(text: "Complete Registration", onPressed: (){
                            if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${_nrcNo}/${_dateOfBirth}/${_selectedGender}/${_selectedBloodGroup}/${_weight}/${_lastDonationDate}/${_medicalRemark}")));
                         }
                      }),

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Row(
      children: [
        Container(width: 4, height: 20, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 8),
        Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
      ],
    );
  }
}