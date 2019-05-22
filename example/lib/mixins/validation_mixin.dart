class ValidationMixin {
  String validateDestination(String value) {
    if ((!value.contains(new RegExp(r'[A-Z]'))) || (value.length < 3)) {
      return 'Please enter a valid destination';
    }
    return null;
  }

  String validateBudget(String value) {
    if (value.length < 2) {
      return 'Budget should be 99+';
    }
    return null;
  }

  String validateNumberOfGuests(String value) {
    if (value.length != 1) {
      return 'Number of guests should be 1-9';
    }
    return null;
  }

}