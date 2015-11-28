#ifndef SCRYPT_H
#define SCRYPT_H

#include <stdint.h>
#include <stdio.h>

extern void scrypt_regenhash(const uint32_t* input, uint32_t *ostate);


#endif /* SCRYPT_H */
