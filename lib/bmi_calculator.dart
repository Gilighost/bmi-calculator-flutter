enum BMIResult {
  overweight,
  normal,
  underweight,
}

enum Gender {
  male,
  female,
}

abstract class BMICalculator {
  static double calculateBMI(int height, int weight) =>
      ((weight / (height * height)) * 703);

  static BMIResult _getResultFromRange(
          double bmi, double underweightCutoff, double overWeightCutoff) =>
      bmi >= overWeightCutoff
          ? BMIResult.overweight
          : bmi > underweightCutoff ? BMIResult.normal : BMIResult.underweight;

  static BMIResult getResult(
    double bmi,
    Gender gender,
    int age,
  ) {
    if (gender == Gender.female) {
      return _getResultFromRange(bmi, 18.5, 25);
    }

    if (age < 24) {
      return _getResultFromRange(bmi, 19, 25);
    } else if (age < 34) {
      return _getResultFromRange(bmi, 20, 26);
    } else if (age < 44) {
      return _getResultFromRange(bmi, 21, 27);
    } else if (age < 54) {
      return _getResultFromRange(bmi, 22, 28);
    } else if (age < 64) {
      return _getResultFromRange(bmi, 23, 29);
    } else {
      return _getResultFromRange(bmi, 24, 30);
    }
  }

  static String getNormalRange(
    Gender gender,
    int age,
  ) {
    if (gender == Gender.female) {
      return '18.5 - 24';
    }

    if (age < 24) {
      return '19 - 24';
    } else if (age < 34) {
      return '20 - 25';
    } else if (age < 44) {
      return '21 - 26';
    } else if (age < 54) {
      return '22 - 27';
    } else if (age < 64) {
      return '23 - 28';
    } else {
      return '24 - 29';
    }
  }
}
