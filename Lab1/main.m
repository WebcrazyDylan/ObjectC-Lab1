//
//  main.m
//  Lab1
//
//  Created by Dylan Park on 2021-07-06.
//

#import <Foundation/Foundation.h>

NSString *getUserInput(int maxLength, NSString *prompt) {
  if (maxLength < 1) {
    maxLength = 255;
  }
  NSLog(@"%@ ", prompt);
  // 1. user c-api to get user input
  char inputChars[maxLength]; // create a char array of size maxLength
  char *result = fgets(inputChars, maxLength, stdin);
  
  // 2. convert it to NSString
  if (result != NULL) {
    NSString *string = [NSString stringWithUTF8String:inputChars];
    NSCharacterSet *whiteSpaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [string stringByTrimmingCharactersInSet:whiteSpaces];
  }
  return NULL;
}

int showMenu(int maxLength, NSString *prompt) {
  if (maxLength < 1) {
    maxLength = 255;
  }
    NSLog(@"==== Options ====\n1. Uppercase \n2. Lowercase \n3. Numberize \n4. Canadianize \n5. Respond \n6. De-Space-It \n99. Exit");
//    NSLog(@"2. Lowercase ");
//    NSLog(@"3. Numberize ");
//    NSLog(@"4. Canadianize ");
//    NSLog(@"5. Respond ");
//    NSLog(@"6. De-Space-It ");
  NSLog(@"%@ ", prompt);
  // 1. user c-api to get user input
  char inputChars[maxLength]; // create a char array of size maxLength
  char *result = fgets(inputChars, maxLength, stdin);
  
  // 2. convert it to NSString
  if (result != NULL) {
    NSString *string = [NSString stringWithUTF8String:inputChars];
    NSCharacterSet *whiteSpaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    string = [string stringByTrimmingCharactersInSet:whiteSpaces];
    int menu = [string intValue];
      return menu;
  }
  return 0;
}

void getOperations(int menu, NSString *userInput) {
    if (menu == 1) {
        NSLog(@"Result : %@ ", [userInput uppercaseString]);
    } else if (menu == 2) {
        NSLog(@"Result : %@ ", [userInput lowercaseString]);
    } else if (menu == 3) {
        NSLog(@"Result : %ld ", [userInput integerValue]);
    } else if (menu == 4) {
        NSLog(@"Result : %@ ", [userInput stringByAppendingString:@", eh?"]);
    } else if (menu == 5) {
        if ([userInput hasSuffix:@"?"]){
            NSLog(@"Result : I don't know. ");
        } else if ([userInput hasSuffix:@"!"]){
            NSLog(@"Result : Whoa, calm down! ");
        }
        
    } else if (menu == 6) {
        NSString *newString = [userInput stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        NSLog(@"Result : %@ ", newString );
    } else if (menu == 99) {
        NSLog(@"Good Bye");
    }
    else {
        NSLog(@"Error operation number. Try again");
    }
    
    NSLog(@"=====================================");
    
//    return [userInput uppercaseString];
//    return [userInput lowercaseString];
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      int menu = 0;
      while (menu != 99) {
          NSString *userInput = getUserInput(255, @"Enter some text : ");
           menu = showMenu(255, @"Enter number of options: ");
          
          getOperations(menu, userInput);
            
      //    NSLog(@"Result : %@", result);
      }
    
  }
   
  return 0;
}
