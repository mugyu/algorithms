/**
 * LINEAR HASH
 *   線形二乗アルゴリズムを使用
 *   Rubyと違ってC言語だと mod に比べてかなり早くなる
 *
 * linear hash: 3.608443
 * hash(mod): 5.345495
 */

#ifdef WIN32

#include <windows.h>
double get_time()
{
    LARGE_INTEGER t, f;
    QueryPerformanceCounter(&t);
    QueryPerformanceFrequency(&f);
    return (double)t.QuadPart/(double)f.QuadPart;
}

#else

#include <sys/time.h>
#include <sys/resource.h>

double get_time()
{
    struct timeval t;
    struct timezone tzp;
    gettimeofday(&t, &tzp);
    return t.tv_sec + t.tv_usec * 1e-6;
}

#endif

#include <stdio.h>
#include <math.h>
#define TIMES 2000000000

void linear_hash(int num)
{
	int n;
	int result;

	for(n = 0; n < TIMES; n++)
	{
		/* linear hash */
		result = n & (num - 1);
	}
}

void hash(int num)
{
	int n;
	int result;

	for(n = 0; n < TIMES; n++)
	{
		/* hash(mod) */
		result = n % num;
	}
}

int main()
{
	int n;
	int result;
	double begin1;
	double end1;
	double begin2;
	double end2;
	const int num = (int)pow(2, 2);

	begin1 = get_time();
	linear_hash(num);
	end1 = get_time();
	printf("linear hash: %f\n", end1 - begin1);

	begin2 = get_time();
	hash(num);
	end2 = get_time();
	printf("hash(mod): %f\n", end2 - begin2);

	return 0;
}
