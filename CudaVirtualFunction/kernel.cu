#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <iostream>
#include <stdio.h>
#include "VSimple.h"

#define size1 127

__global__ void virtualcounter(int *a, int *b, int *c, int n)
{
	int i = threadIdx.x;
	if (i < n)
		c[i] = a[i] + b[i];
}


__global__ void virtualcounter1(int *max, int *res)
{

	VSimple vsm;
	//vsm.SimpleCouter(max, res);
	vsm.Justtest(max, res);


}


int main()
{
	{
		int a[size1], b[size1], c[size1];
		int *d_a, *d_b, *d_c;



		cudaMalloc(&d_a, size1 * sizeof(int));
		cudaMalloc(&d_b, size1 * sizeof(int));
		cudaMalloc(&d_c, size1 * sizeof(int));

		for (char i = 0; i < 127; i++)
		{
			a[i] = i;
			b[i] = i;
			c[i] = i;
		}

		cudaMemcpy(d_a, a, size1 * sizeof(int), cudaMemcpyHostToDevice);
		cudaMemcpy(d_b, b, size1 * sizeof(int), cudaMemcpyHostToDevice);
		cudaMemcpy(d_c, c, size1 * sizeof(int), cudaMemcpyHostToDevice);

		virtualcounter <<<1, size1 >>> (d_a, d_b, d_c, size1);

		cudaMemcpy(c, d_c, size1 * sizeof(int), cudaMemcpyDeviceToHost);
		for (char i = 0; i < 10; i++)
		{
			printf("\n  %i", c[i]);
		}


		cudaFree(d_a);
		cudaFree(d_b);
		cudaFree(d_c);

	}



	{
		int *max, *res;
		int *d_max, *d_res;

		max = (int *)malloc(sizeof(int));
		res = (int *)malloc(20 * sizeof(int));


		cudaMalloc(&d_max, sizeof(int));
		cudaMalloc(&d_res, 20 * sizeof(int));


		*max = 10;
		for (char i = 0; i < 20; i++)
		{
			if (i < 10) res[i] = 0;
			else res[i] = -1;
		}




		cudaMemcpy(d_max, max, sizeof(int), cudaMemcpyHostToDevice);
		cudaMemcpy(d_res, res, 20 * sizeof(int), cudaMemcpyHostToDevice);

		virtualcounter1 << <1, size1 >> > (d_max, d_res);
		for (char i = 0; i < 20; i++)			printf("%i   ", res[i]);


		cudaMemcpy(res, d_res, 20 * sizeof(int), cudaMemcpyDeviceToHost);
		printf("\n  ");
		for (char i = 0; i < 20; i++)			printf("%i   ", res[i]);


		free(max);
		free(res);

		cudaFree(d_max);
		cudaFree(d_res);

	}




}


