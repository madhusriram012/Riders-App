import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/assistantMethods/get_current_location.dart';
import 'package:riders_app/global/global.dart';
import 'package:riders_app/mainScreens/parcel_picking_screen.dart';
import 'package:riders_app/models/address.dart';
import 'package:riders_app/splashScreen/splash_screen.dart';


class ShipmentAddressDesign extends StatelessWidget
{
  final Address? model;
  final String? orderStatus;
  final String? orderId;
  final String? sellerId;
  final String? orderByUser;

  ShipmentAddressDesign({this.model, this.orderStatus, this.orderId, this.sellerId, this.orderByUser});



  confirmedParcelShipment(BuildContext context, String getOrderID, String sellerId, String purchaserId)
  {
    FirebaseFirestore.instance
        .collection("orders")
        .doc(getOrderID)
        .update({
      "riderUID": sharedPreferences!.getString("uid"),
      "riderName": sharedPreferences!.getString("name"),
      "status": "picking",
      // "lat": position!.latitude,
      // "lng": position!.longitude,
      "address": completeAddress,
    });

    //send rider to shipmentScreen
    Navigator.push(context, MaterialPageRoute(builder: (context) => ParcelPickingScreen(
      purchaserId: purchaserId,
      purchaserAddress: model!.fullAddress,
      purchaserLat: model!.lat,
      purchaserLng: model!.lng,
      sellerId: sellerId,
      getOrderID: getOrderID,
    )));
  }



  @override
  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
                'Shipping Details:',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontFamily: "Inter")
            ),
          ),
        ),
        // const SizedBox(
        //   height: 5.0,
        // ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Table(
            children: [
              TableRow(
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(color: Colors.black,fontFamily: "Inter"),
                  ),
                  Text(model!.name!,style: TextStyle(fontFamily: "Inter"),),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    "Phone ",
                    style: TextStyle(color: Colors.black,fontFamily: "Inter"),
                  ),
                  Text(model!.phoneNumber!,style: TextStyle(fontFamily: "Inter")),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    "Address",
                    style: TextStyle(color: Colors.black,fontFamily: "Inter"),
                  ),
                  Text(model!.fullAddress!,style: TextStyle(fontFamily: "Inter")),
                ],
              ),
            ],
          ),
        ),
        // const SizedBox(
        //   height: 5,
        // ),

        // const SizedBox(
        //   height: 5,
        // ),


        orderStatus == "ended"
            ? Container()
            : Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: InkWell(
              onTap: ()
              {
                // UserLocation uLocation = UserLocation();
                // uLocation.getCurrentLocation();

                confirmedParcelShipment(context, orderId!, sellerId!, orderByUser!);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: const BoxDecoration(
                    color:  Color(0xffc3b091),
                  ),
                  width: MediaQuery.of(context).size.width - 120,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Confirm - To Deliver this Parcel",
                      style: TextStyle(color: Colors.white, fontSize: 15.0,fontFamily: "Inter"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),


        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: InkWell(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MySplashScreen()));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: const BoxDecoration(
                    color:  Color(0xffc3b091),
                  ),
                  width: MediaQuery.of(context).size.width - 200,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Go Back",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20,),
      ],
    );
  }
}
