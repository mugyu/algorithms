/**
 * 高速逆平方根計算アルゴリズム
 * https://itchyny.hatenablog.com/entry/2016/07/25/100000
 * https://en.wikipedia.org/wiki/Fast_inverse_square_root
 */
#include <stdio.h>
#include <stdlib.h>

float fast_inverse_square_root(float x) {
  int i = *(int*)&x;
  i = 0x5f3759df - (i >> 1);
  float y = *(float*)&i;
  return y * (1.5F - 0.5F * x * y * y);
}

int main(void) {
  char line[8];
  char *endptr = NULL;
  float x;
  while (scanf("%s", line) != -1) {
    x = strtof(line, &endptr);
    printf("%f\n", fast_inverse_square_root(x));
  }
  return 0;
}
