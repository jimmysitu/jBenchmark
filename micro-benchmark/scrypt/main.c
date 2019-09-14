#include "scrypt.h"

static char magic[0x1000] __attribute__ ((aligned(16)));

int main(){
    uint32_t data[20];
    uint32_t ohash[8];
    uint32_t ghash[8];

    
    int i;

    data[0] = 0x03000000;
    data[1] = 0xD85901A9;
    data[2] = 0x2CCE4E2F;
    data[3] = 0xF346C152;
    data[4] = 0x05BDA9EC;
    data[5] = 0x279CDEA2;
    data[6] = 0x2C12D034;
    data[7] = 0x05697A50;
    data[8] = 0x419EF50C;
    data[9] = 0xC1F6BAC0;
    data[10] = 0x52D51B0B;
    data[11] = 0xCFFAC6F9;
    data[12] = 0xF87CF9D0;
    data[13] = 0xB9EFB703;
    data[14] = 0xEE355D4F;
    data[15] = 0x6F7FBF52;
    data[16] = 0x6CC3B212;
    data[17] = 0x3F245956;
    data[18] = 0x51A3011B;
    data[19] = 0x00017697;

    ghash[0] = 0x00000094;
    ghash[1] = 0xC90A9499;
    ghash[2] = 0x6260A7BE;
	ghash[3] = 0x0DB6FCD4;
	ghash[4] = 0xE698C27E;
	ghash[5] = 0x8AD4A365;
	ghash[6] = 0x3FECABB9;
	ghash[7] = 0x637F983E;

    magic[0x0110] = 0xAA;
    magic[0x0220] = 0x55;
    for (i = 0; i < 1024; i++){
        scrypt_regenhash(data, ohash);
    }
    magic[0x0330] = 0x00;
    magic[0x0440] = 0xFF;

    for (i = 0; i < 8; i++){
        printf("ghash: 0x%08X, ohash: 0x%08X\n", ghash[i], ohash[i]);
    }
}
