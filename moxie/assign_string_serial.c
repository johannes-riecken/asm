#include <stdio.h>

int _write (int fd, char *buf, int len)
{
  int i = 0;
  while (i < len)
    *(char *)0x3f8 = buf[i++];
  return len;
}

int main()
{
  puts ("Hello World!");
  return 0;
}
