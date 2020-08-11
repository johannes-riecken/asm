#include <stdio.h>
int add(int x, int y) {
  return x + y;
}

int main() {
  printf("%d\n",add(2,5));
  printf("%d\n",add(2,9));
  return 0;
}
