import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/caticons_icons.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/shared/components/component.dart';

class Reservation extends StatelessWidget {
  var timeControl = TextEditingController();
  var dateControl = TextEditingController();
  var guestControl = TextEditingController();
  var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ResturantReservationSuccessState) {
          if (state.reservationModel.status) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.reservationModel.massege),
              padding: EdgeInsetsDirectional.all(20),
              duration: Duration(milliseconds: 950),
            ));
            timeControl.clear();
            dateControl.clear();
            guestControl.clear();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              design(
                  chiled: Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                  right: 20,
                  left: 20,
                  bottom: 20,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: keyForm,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                defaultFormField(
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'please enter your date';
                                    }
                                  },
                                  prefix: Caticons.calendar,
                                  controller: dateControl,
                                  textAlign: TextAlign.center,
                                  type: TextInputType.datetime,
                                  hint: 'Rservation Date',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2050))
                                        .then(
                                      (value) {
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(value);
                                        dateControl.text = formattedDate;
                                        print(dateControl.text.toString());
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            defaultFormField(
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'please enter your time';
                                  }
                                },
                                controller: timeControl,
                                prefix: Caticons.clock,
                                textAlign: TextAlign.center,
                                type: TextInputType.datetime,
                                hint: 'Reservation Time',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeControl.text =
                                        value.format(context).toString();
                                  });
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            defaultFormField(
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your guest';
                                }
                              },
                              prefix: Caticons.guest,
                              controller: guestControl,
                              textAlign: TextAlign.center,
                              type: TextInputType.number,
                              hint: 'Guests',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        defaultButton(
                          function: () {
                            if (keyForm.currentState.validate()) {
                              HomeCubit.get(context).userReservation(
                                res_date: dateControl.text,
                                res_guest_count: guestControl.text,
                                res_time: timeControl.text,
                              );
                            }
                          },
                          text: 'submit',
                        )
                      ],
                    ),
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Reservation',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
