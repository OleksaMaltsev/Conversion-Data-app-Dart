void main() {
  Map conversionData = convertMetric(data);
  Map conversionData2 = convertMetric(data2);
  Map conversionData3 = convertMetric(data3);
  Map conversionData4 = convertMetric(data4);
  Map conversionData5 = convertMetric(data5);
  Map conversionData6 = convertMetric(data6);

  print(conversionData);
  print(conversionData2);
  print(conversionData3);
  print(conversionData4);
  print(conversionData5);
  print(conversionData6);
}

// функція конвертації
Map convertMetric(Map unitConvert) {
  List<Map> listConvert = tableUnit[unitConvert["distance"]["unit"]];
  var unitValue;
  double result = 0;
  for (var unit in listConvert) {
    // знаходимо потрібну одиницю у словнику
    if (unit.keys.toString().substring(1, 3) == unitConvert["convert_to"]) {
      // зберігаємо одиницю виміру
      unitValue = unitConvert["distance"]["unit"];
      // зберігаємо знак в змінну
      String sign = unit.keys.toString().substring(3, 4);
      // дістаємо потрібне значення для конвертації із формули
      double a = unit[unit.keys.toString().substring(1, 4)];
      // значення яке потрібно конвертувати
      double b = unitConvert["distance"]["value"];

      // з'ясовуємо який знак потрібен / чи *
      if (sign == "*") {
        result = a * b;
      } else if (sign == "/") {
        result = b / a;
      }
    }
  }
  return {"unit": unitValue, "value": result.toStringAsFixed(2)};
}

// таблиця конвертації одиниць
Map tableUnit = {
  "mt": [
    {"ft*": 3.2808},
    {"in*": 39.370},
    {"cm/": 0.01},
    {"yd*": 1.0936},
    {"km/": 1000},
    {"mi*": 0.00062137}
  ],
  "ft": [
    {"mt/": 3.2808},
    {"in*": 12},
    {"cm/": 0.032808},
    {"yd*": 0.33333},
    {"km/": 3280.8},
    {"mi*": 0.00018939}
  ],
  "in": [
    {"ft*": 0.083333},
    {"mt/": 39.370},
    {"cm/": 0.39370},
    {"yd*": 0.027778},
    {"km/": 39370},
    {"mi*": 0.000015783}
  ],
  "cm": [
    {"ft*": 0.032808},
    {"mt/": 100},
    {"in*": 0.39370},
    {"yd*": 0.010936},
    {"km/": 100000},
    {"mi*": 0.0000062137}
  ],
  "yd": [
    {"ft*": 3},
    {"mt/": 1.0936},
    {"in*": 36},
    {"cm/": 0.010936},
    {"km/": 1093.6},
    {"mi*": 0.00056818}
  ],
  "km": [
    {"ft*": 3280.8},
    {"mt*": 1000},
    {"in*": 39370},
    {"cm*": 100000},
    {"yd*": 1093.6},
    {"mi*": 0.62137}
  ],
  "mi": [
    {"ft*": 5280},
    {"mt/": 0.00062137},
    {"in*": 63360},
    {"cm/": 0.0000062137},
    {"yd*": 1760},
    {"km/": 0.62137}
  ]
};

// об'єкти з правилами для конвертації одиниць
Map data = {
  "distance": {"unit": "mt", "value": 0.5},
  "convert_to": "ft"
};

Map data2 = {
  "distance": {"unit": "ft", "value": 4.5},
  "convert_to": "cm"
};

Map data3 = {
  "distance": {"unit": "in", "value": 12.3},
  "convert_to": "mi"
};

Map data4 = {
  "distance": {"unit": "cm", "value": 3.3},
  "convert_to": "yd"
};

Map data5 = {
  "distance": {"unit": "km", "value": 31.3},
  "convert_to": "mi"
};

Map data6 = {
  "distance": {"unit": "mi", "value": 12.9},
  "convert_to": "cm"
};
