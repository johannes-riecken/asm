int bar(int i, int j) {
    char *str = "Goodbye, World!";
    return i + j;
}

int foo(int i) {
    return bar(i,i);
}


int foo1() {
    return foo(5);
}

int main() {
  char *str = "Hello, World!";
  return 0;
}
