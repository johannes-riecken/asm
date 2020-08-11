#include <stdio.h>

int main() {
	float f = 0x1.fp3;
	printf("%f\n",f);
	printf("%f\n",0x1p3);
	printf("%f\n",0x1.p3);
	f = 0x1.fp2;
	printf("%f\n",f);
	f = 0x1.fp1;
	printf("%f\n",f);
	f = 0x1.fp0;
	printf("%f\n",f);
	f = 0x2.fp3;
	printf("%f\n",f);
	f = 0x2.fp2;
	printf("%f\n",f);
	f = 0x2.fp1;
	printf("%f\n",f);
	f = 0x2.fp0;
	printf("%f\n",f);
	f = 0x3.fp0;
	printf("%f\n",f);
	f = 0x4.fp0;
	printf("%f\n",f);
	f = 0x5.fp0;
	printf("%f\n",f);
	f = 0x6.fp0;
	printf("%f\n",f);
	f = 0x7.fp0;
	printf("%f\n",f);
	printf("%a\n",2.);
	printf("%a\n",256.);
}
