import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_example/credit_card_controller.dart';
import 'package:reactive_forms_example/credit_card_widget.dart';
import 'package:reactive_forms_example/credit_cards.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formularios Reactivos'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: ReactiveForm(
            formGroup: controller.creditCardForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _textFormNameCard(),
                SizedBox(height: 10),
                _textFormNumberCard(),
                SizedBox(height: 5),
                _addCreditCard(),
                Divider(),
                StreamBuilder(
                    stream: controller.creditCardForm.valueChanges,
                    builder: (context, snapshot) {
                      return CreditCardWidget(
                          cardHolder: controller.getNameCreditCardForm,
                          cardNumber: controller.getNumberCreditCardForm);
                    }),
                Divider(),
                CreditCardsList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFormNameCard() {
    return ReactiveTextField(
      formControlName: 'creditCardOwnerName',
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
        labelText: "Nombre en la Tarjeta",
      ),
    );
  }

  Widget _textFormNumberCard() {
    return ReactiveTextField(
      formControlName: 'creditCardNumber',
      validationMessages: (control) => {'pattern': ''},
      keyboardType: TextInputType.number,
      inputFormatters: [],
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(
              7.0,
            )),
        labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
        labelText: "Número de la Tarjeta",
      ),
    );
  }

  Widget _addCreditCard() {
    return ElevatedButton.icon(
        onPressed: () {
          if (controller.creditCardForm.valid) {
            controller.addCreditCard(controller.getNumberCreditCardForm);
            controller.cleanCreditCardForm();
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
        icon: Icon(Icons.credit_card),
        label: Text('Agregar Tarjeta'));
  }
}
