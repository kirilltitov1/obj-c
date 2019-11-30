//
//  main.m
//  HW1.1
//
//  Created by Kirill Titov on 29/11/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//


#import "main.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        float a = 0, b = 0;
        char sing;
        char tresh;
//        не понравилось че то ))) слишком много мусора в консоль кидает!
//        NSLog(@"\nInput a = ");

    input:
        printf("Input a sing b:\n");
        if ( (scanf("%f%c", &a, &tresh) == 2) && (tresh == ' ') ) {
            if (*(*stdin)._p != EOL || *(*stdin)._p != '\0') {
                if ( (scanf("%c%c", &sing, &tresh) == 2) ) {
                    if (*(*stdin)._p != EOL && *(*stdin)._p != '\0') {
                        if ( (scanf("%f%c", &b, &tresh) == 2) && (tresh == EOL) ) {
                            
                        } else { printf("Input error try again \n") ; goto input; }
                    } else { printf("Input error try again \n") ; goto input; }
                } else { printf("Input error try again \n") ; goto input; }
            } else { printf("Input error try again \n") ; goto input; }
        } else { printf("Input error try again \n") ; goto input; }
     
        switch (sing) {
            case '-':
                NSLog(@"\nResult = %f", a-b);
                break;
                
            case '+':
                NSLog(@"\nResult = %f", a+b);
                break;
                
            case '*':
                NSLog(@"\nResult = %f", a*b);
                break;
                
            case '/':
                NSLog(@"\nResult = %f", a/b);
                break;
                
            default:
                break;
        }
        
    }
    return 0;
}
