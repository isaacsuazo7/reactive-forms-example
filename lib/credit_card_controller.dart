import 'package:reactive_forms/reactive_forms.dart';

class CreditCardController {
  final FormGroup creditCardForm = FormGroup({
    'creditCardOwnerName':
        FormControl<String>(validators: [Validators.required], value: ''),
    'creditCardNumber': FormControl(validators: [
      Validators.required,
      Validators.maxLength(16),
    ], value: ''),
  });

  String get getNameCreditCardForm =>
      this.creditCardForm.control('creditCardOwnerName').value;
  String get getNumberCreditCardForm =>
      this.creditCardForm.control('creditCardNumber').value;

  void cleanCreditCardForm() {
    this.creditCardForm.control('creditCardOwnerName').value = '';
    this.creditCardForm.control('creditCardNumber').value = '';
  }

  //Array

  final FormGroup creditCardsForm =
      FormGroup({'credtiCards': FormArray<String>([])});

  FormArray get getCreditCards =>
      creditCardsForm.control('credtiCards') as FormArray;

  addCreditCard(String value) {
    this.getCreditCards.add(FormControl<String>(value: value));
  }

  List<String> creditCards() {
    List<String> creditCards = [];
    FormArray formArray = getCreditCards;

    formArray.controls.asMap().forEach((index, tip) {
      creditCards.add(tip.value);
    });

    return creditCards;
  }

  deleteCreditCard(int index) {
    this.getCreditCards.removeAt(index);
  }
}

final controller = CreditCardController();
