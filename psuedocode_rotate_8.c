#include <stdio.h>
int rotate (int bit_16, int times);
int main() {
    int input = 10;
    int times = 5;
    printf("initially :\n");
    for (int i = 7; i >= 0; i--) {
        printf("%d", (input >> i) & 1 );
    }
    printf("\n");
    printf("after rotate :\n");
    int ret = rotate (input, times);
    
    for (int i = 7; i >= 0; i--) {
        printf("%d", (ret >> i) & 1 );
    }
    printf("\n");
    return 0;
}
int rotate (int bit_16, int times ) {
    int bit;
    for (int i = 0; i < times; i++) {
        bit = bit_16 & 1;
        bit_16 = bit_16 << 8;
        bit_16 = bit_16 >> 9;
        
        bit_16 = bit_16 | (bit << 7);
        
    }


    
    return bit_16;
}
