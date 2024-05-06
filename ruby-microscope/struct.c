#include <stdio.h>
#include <stdlib.h>

#define R_CAST(st) (struct st *)
#define RBASIC(obj) (R_CAST(RBasic)(obj))

typedef struct {
  int dummy;
} VALUE;

struct RBasic {
  VALUE flags;
  VALUE klass;
};

struct RClass {
  struct RBasic basic;
  VALUE dummy;
};

int main() {
  printf("sizeof RBasic: %lu bytes\n", sizeof(struct RBasic)); // 8 bytes
  printf("sizeof RClass: %lu bytes\n", sizeof(struct RClass)); // 12 bytes
  struct RClass *klass = malloc(sizeof(struct RClass));
  printf("klass ptr: %p\n", klass);
  printf("&klass->basic: %p\n", &(klass->basic));
  klass->basic.flags.dummy = 1;

  printf("klass->basic.flags: %d\n", klass->basic.flags.dummy); // 1

  struct RBasic *basic = RBASIC(klass);
  printf("casted basic ptr: %p\n", basic);

  printf("basic->flags: %d\n", basic->flags.dummy); // 1

  klass->basic.flags.dummy = 2;

  printf("klass->basic.flags: %d\n", klass->basic.flags.dummy); // 2
  printf("basic->flags: %d\n", basic->flags.dummy);             // 2

  struct RClass *klass2 = (struct RClass *)basic;
  printf("klass2->basic.flags: %d\n", klass2->basic.flags.dummy); // 2

  free(klass);
  return 0;
}
