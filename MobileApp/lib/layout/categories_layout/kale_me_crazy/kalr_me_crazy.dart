
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';

class KaleMeCrazy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KaleCrazyCubit,KaleCrazyState>(
    listener: (context,state){},
      builder: (context,state)
      {
        //عملت متغير سميته كويبت وبخزن فيه
        //وعشان استخدمه تحت في الاسكرينات
        var cubit =KaleCrazyCubit.get(context);
        return Scaffold(
          //استدعيت من الكيوبت الاسكرينات بتاعتي بكل انديكس
          body:cubit.screen[cubit.CurrentIndex],

          //---------------------------------------
          bottomNavigationBar: BottomNavigationBar(
            //النوع بتاع الbutton
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.red,
            //استدعيت الايكونات
            items: cubit.bottom,
            //بديلها الانديكس الي اول ما افتح واقف عليه
            currentIndex: cubit.CurrentIndex,
            //هنا بغير ما الانديكس عند الضغط علي الايكونه يفتح الاسكرينه الخاص به
            onTap: (int index)
            {
              cubit.ChangeNavBar(index);
            },
          ),
        );
      },
    );
  }
}
