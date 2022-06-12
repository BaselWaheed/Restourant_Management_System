import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/shared/components/component.dart';


class AccountInfo extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var userNameController = TextEditingController();
  var birthdateController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = HomeCubit.get(context).userModel;
        if(model!=null){emailController.text = model.user.email;
        firstNameController.text = model.user.firstname;
        lastNameController.text = model.user.lastname;
        userNameController.text = model.user.username;
        birthdateController.text = model.user.birthdate;
        phoneController.text=model.user.phone;
        addressController.text=model.user.address;}
        return ConditionalBuilder(
          condition: model != null,
          builder: (context) => Scaffold(
            body: Stack(
              children: [
                design(
                    chiled: Padding(
                  padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            if (state is ResturantLoadingUpdateUserState)
                              LinearProgressIndicator(),
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            defaultFormField(
                              controller: emailController,
                              prefix: Icons.email_outlined,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your email address';
                                }
                              },
                              type: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'First name',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            defaultFormField(
                              controller: firstNameController,
                              prefix: Icons.person_add_alt_1,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your first name';
                                }
                              },
                              hint: 'fname',
                              type: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Last Name',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            defaultFormField(
                              controller: lastNameController,
                              prefix: Icons.person_add_alt_1,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your last name';
                                }
                              },
                              hint: 'name',
                              type: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'user name',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            defaultFormField(
                              controller: userNameController,
                              prefix: Icons.person,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your user name';
                                }
                              },
                              hint: 'User Name',
                              type: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Date Of Birth',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            defaultFormField(
                              controller: birthdateController,
                              prefix: Icons.date_range_outlined,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your birth of date ';
                                }
                              },
                              hint: '19/4/1982',
                              type: TextInputType.datetime,
                                onTap: () {
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2050))
                                      .then((value) {
                                    String formattedDate =
                                    DateFormat('yyyy-MM-dd')
                                        .format(value);
                                    birthdateController.text = formattedDate;
                                    print(birthdateController.text.toString());
                                  },);
                                }

                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            defaultFormField(
                              controller: phoneController,
                              prefix: Icons.phone_android,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your phone number';
                                }
                              },
                              hint: 'Phone Number',
                              type: TextInputType.number,
                              indexLenght: 11,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            defaultFormField(
                              controller: addressController,
                              prefix: Icons.add_location_alt_outlined,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your address';
                                }
                              },
                              hint: 'Address',
                              type: TextInputType.number,
                              indexLenght: 11,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            defaultButton(
                              text: 'Save',
                              function: () {
                                if (formKey.currentState.validate()) {
                                  HomeCubit.get(context).updateUserData(
                                      firstname: firstNameController.text,
                                      lastname: lastNameController.text,
                                      username: userNameController.text,
                                      email: emailController.text,
                                      birthdate: birthdateController.text,
                                      phone: phoneController.text,
                                      address: addressController.text,
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                          )),
                      Center(
                        child: Text(
                          'Account Info',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          fallback: (context) =>
              Center(child: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}
