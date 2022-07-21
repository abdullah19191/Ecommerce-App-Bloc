import 'package:ecommerce_app_block/Widgets/custom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/Order_summary.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../block/checkout/checkout_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static const String routeName = '/CheckoutScreen';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'CHECKOUT',
      ),
      bottomNavigationBar: _CheckoutnavBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return CircularProgressIndicator();
            }
            if (state is CheckoutLoaded) {
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CUSTOMER INFORMATION',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(email: value));
                      }, context, 'Email'),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(fullName: value));
                      }, context, 'Full Name'),
                      Text(
                        'DELIVERY INFORMATION',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(address: value));
                      }, context, 'Address'),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(city: value));
                      }, context, 'City'),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(country: value));
                      }, context, 'Country'),
                      _buildTextFormField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(zipcode: value));
                      }, context, 'Zip Code'),
                      Text(
                        'ORDER INFORMATION',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      OrderSummary()
                    ]),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}

Padding _buildTextFormField(
    Function(String)? onChanged, BuildContext context, String labelText) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
            child: TextFormField(
          onChanged: onChanged,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ))
      ],
    ),
  );
}

_CheckoutnavBar() {
  return BottomAppBar(
    color: Colors.black,
    child: Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if(state is CheckoutLoading){
                return CircularProgressIndicator();
              }
              if(state is CheckoutLoaded){
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
                  },
                  child: Text(
                    'ORDER NOW',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                );
              }else{
                return Text('Something Went Wrong');
              }
            },
          )
        ],
      ),
    ),
  );
}
