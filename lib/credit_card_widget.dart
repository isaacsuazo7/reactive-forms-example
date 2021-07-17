import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;

  const CreditCardWidget(
      {Key? key, required this.cardNumber, required this.cardHolder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.80,
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIconAndNameCard(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: (cardNumber == "")
                  ? Text(
                      'XXXX XXXX XXXX XXXX',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    )
                  : Text(
                      '$cardNumber',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: (cardHolder == '')
                      ? _buildDetail(
                          'NOMBRES APELLIDOS',
                        )
                      : _buildDetail(
                          cardHolder,
                        ),
                ),
                _buildDetail('12/21'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildIconAndNameCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Dev Team 504',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.credit_card,
              size: 30,
              color: Colors.white,
            )),
      ],
    );
  }

  Column _buildDetail(String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${value!.toUpperCase()}',
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
