import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/review_screen/order_screen.dart';
import 'package:untitled1/shared/components/component.dart';


class CreateOrderScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ResturantSuccessOrderDataStates) {
          navegateTo(context, OrderScreen());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text('Order Created Successfully'),
            padding: EdgeInsetsDirectional.all(20),
            duration: Duration(milliseconds: 800),
          ));
        } else if (state is ResturantErrorOrderDataStates) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red.withOpacity(0.7),
            content: Text(
              'field',
              style: TextStyle(fontSize: 20),
            ),
            padding: EdgeInsetsDirectional.all(20),
            duration: Duration(milliseconds: 800),
          ));
        }
      },
      builder: (context, state) {
        var model = HomeCubit.get(context).userModel;
        phoneController.text = model.user.phone;
        addressController.text = model.user.address;
        return ConditionalBuilder(
          condition: model != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.red,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
              child: Center(
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
                        'Address',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      defaultFormField(
                        controller: addressController,
                        prefix: Icons.location_on,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'please enter your address';
                          }
                        },
                        type: TextInputType.text,
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
                        indexLenght: 11,
                        controller: phoneController,
                        prefix: Icons.phone_android_rounded,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'please enter your phone';
                          }
                        },
                        type: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      defaultButton(
                        text: 'Save',
                        function: () {
                          HomeCubit.get(context).checkOutData(
                              address: addressController.text,
                              phone: phoneController.text);
                          addressController.clear();
                          phoneController.clear();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
