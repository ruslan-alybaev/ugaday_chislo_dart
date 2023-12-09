
import 'dart:io';
import 'dart:math';


void main() {
  // print('Выберите режим игры:');
  // print('1. Я загадываю, компьютер отгадывает');
  // print('2. Компьютер загадывает, я отгадываю');
  // int choice = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
  // if (choice == 1) {
  //   playComputerGuess();
  // } else if (choice == 2) {
  //   playUserGuess();
  // } else {
  //   print("Неверный выбор. Выберите 1 или 2.");
  // }

    print('Введите количество раундов (от 1 до 10, по умолчанию 3):');
  int totalRounds = int.tryParse(stdin.readLineSync() ?? "") ?? 3;
  if (totalRounds < 1 || totalRounds > 10) {
    print('Неверное количество раундов. Установлено значение по умолчанию: 3');
    totalRounds = 3;
  }

  int userWins = 0;
  int computerWins = 0;
  for (var i = 1; i <= totalRounds; i++) {
    print('\n====================');
    print("Раунд $i:");

    // Пользователь загадывает число, компьютер угадывает.
    print('Вы загадываете число, компьютер угадывает:');
    int computerSteps = playComputerGuess();

    // Компьютер загадывает число, пользователь угадывает.
    print('Компьютер загадывает число, вы угадываете:');
    int userSteps = playUserGuess();


print('Раунд $i завершен. Победитель этого раунда:');
if (userSteps < computerSteps) {
    print('Вы! Угадано за $userSteps шагов.');
    userWins++;
} else if (userSteps > computerSteps) {
  print('Компьютер! Угадано за $computerSteps шагов.');
  computerWins++;
} else {
  print('Ничья! Оба участника угадали за одинаковое количество шагов.');
}
  }

  // Определение общего победителя
    print('\n====================');
  print('Игра завершена. Общий итог:');
  if (userWins > computerWins) {
      print('Вы победили в $userWins раундах, компьютер в $computerWins раундах.');
    print('Вы - чемпион!');
  } else if (computerWins > userWins) {
    print('Компьютер победил в $computerWins раундах, вы в $userWins раундах.');
    print('Компьютер - чемпион!');
  } else {
    print('Ничья! Оба участника выиграли по $userWins раундов.');
  }
 


}

int playUserGuess() {
  var random = Random();
  int hiddenNum = random.nextInt(100) + 1;
  int steps = 0;
  print('Компьютер загадал число от 1 до 100. Начинайте отгадывать!');


  while (true) {
    int userGuess = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
    steps++;

    if(userGuess < hiddenNum) {
      print("greater");
    } else if (userGuess > hiddenNum) {
      print("less");
    } else {
      print("Right Answer");
      print('Вы угадали за $steps шагов');
      break;
    }
  }
return steps;
  
}



int playComputerGuess() {
  print('Загадайте число от 1 до 100');
  int targetNumber = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
  int steps = guessNumber(targetNumber);
  print("Угадано за $steps шагов"); 
  return steps;
}

int guessNumber (int target) {
  int low = 1;
  int high = 100;
  int steps = 0;

  while (low <= high) {
    int guess = ((low + high) / 2).floor(); // округляем double до меньшего
    print("Is it $guess");
    String userAnswer = stdin.readLineSync() ?? "";

    if (userAnswer == "less") {
      high = guess - 1;
    } else if (userAnswer == "greater") {
      low = guess + 1;
    } else if (userAnswer == "yes") {
      steps++;
      break;
    } else {
      print("Неверный ответ. Пожалуйста, введите 'less', 'greater' или 'yes'.");
      continue; // Пропускаем неверные ответы и повторяем итерацию
    }
    steps++;
  }
  return steps;
}


// import 'dart:io';
// import 'dart:math';

// void main() {
//   print('Введите количество раундов (от 1 до 10, по умолчанию 3):');
//   int totalRounds = int.tryParse(stdin.readLineSync() ?? "") ?? 3;
//   if (totalRounds < 1 || totalRounds > 10) {
//     print('Неверное количество раундов. Установлено значение по умолчанию: 3');
//     totalRounds = 3;
//   }

//   int userWins = 0;
//   int computerWins = 0;

//   for (int round = 1; round <= totalRounds; round++) {
//     print('\n====================');
//     print('Раунд $round:');

//     // Пользователь загадывает число, компьютер угадывает.
//     print('Вы загадываете число, компьютер угадывает:');
//     int userHiddenNum = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
//     int computerSteps = playComputerGuess(userHiddenNum);

//     // Компьютер загадывает число, пользователь угадывает.
//     print('Компьютер загадывает число, вы угадываете:');
//     int computerHiddenNum = Random().nextInt(100) + 1;
//     int userSteps = playUserGuess(computerHiddenNum);

//     // Определение победителя раунда
//     print('Раунд $round завершен. Победитель этого раунда:');

//     if (userSteps < computerSteps) {
//       print('Вы! Угадано за $userSteps шагов.');
//       userWins++;
//     } else if (computerSteps < userSteps) {
//       print('Компьютер! Угадано за $computerSteps шагов.');
//       computerWins++;
//     } else {
//       print('Ничья! Оба участника угадали за одинаковое количество шагов.');
//     }
//   }

//   // Определение общего победителя
//   print('\n====================');
//   print('Игра завершена. Общий итог:');

//   if (userWins > computerWins) {
//     print('Вы победили в $userWins раундах, компьютер в $computerWins раундах.');
//     print('Вы - чемпион!');
//   } else if (computerWins > userWins) {
//     print('Компьютер победил в $computerWins раундах, вы в $userWins раундах.');
//     print('Компьютер - чемпион!');
//   } else {
//     print('Ничья! Оба участника выиграли по $userWins раундов.');
//   }
// }

// int playUserGuess(int target) {
//   int low = 1;
//   int high = 100;
//   int steps = 0;

//   while (low <= high) {
//     int guess = ((low + high) / 2).floor(); // округляем double до меньшего
//     print("Is it $guess");
//     String userAnswer = stdin.readLineSync() ?? "";

//     if (userAnswer == "less") {
//       high = guess - 1;
//     } else if (userAnswer == "greater") {
//       low = guess + 1;
//     } else if (userAnswer == "yes") {
//       steps++;
//       break;
//     } else {
//       print("Неверный ответ. Пожалуйста, введите 'less', 'greater' или 'yes'.");
//       continue; // Пропускаем неверные ответы и повторяем итерацию
//     }
//     steps++;
//   }
//   return steps;
// }

// int playComputerGuess(int target) {
//   int low = 1;
//   int high = 100;
//   int steps = 0;

//   while (low <= high) {
//     int guess = ((low + high) / 2).floor(); // округляем double до меньшего

//     if (guess == target) {
//       steps++;
//       print('Компьютер угадал ваше число за $steps шагов.');
//       return steps;
//     } else if (guess < target) {
//       low = guess + 1;
//     } else {
//       high = guess - 1;
//     }
//     steps++;
//   }
//   return -steps; // Возвращаем отрицательное значение, чтобы отличить от победы пользователя
// }

// 