import 'package:flutter/material.dart';
import 'package:reactive_forms_example/credit_card_controller.dart';

class CreditCardsList extends StatelessWidget {
  const CreditCardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Listado de Tarjetas',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        StreamBuilder(
            stream: controller.creditCardsForm.valueChanges,
            builder: (context, snapshot) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.creditCards().length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  String creditCard = controller.creditCards()[index];
                  return CreditCardItem(
                    creditCard: creditCard,
                    index: index,
                  );
                },
              );
            }),
      ],
    );
  }
}

class CreditCardItem extends StatelessWidget {
  final String creditCard;
  final int index;
  const CreditCardItem(
      {Key? key, required this.creditCard, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.credit_card),
      title: Text(creditCard),
      trailing: GestureDetector(
        onTap: () {
          controller.deleteCreditCard(index);
        },
        child: Icon(
          Icons.clear,
          color: Colors.red,
        ),
      ),
    );
  }
}
