#pragma once
#include "simple.h"
class VSimple :
	public Simple
{
public:
	__device__ VSimple() {};
	__device__ ~VSimple() {};
	__device__ void SimpleCouter(int *max, int *res)
	{
		int i = threadIdx.x;
		if (i < 10)
			res[i] = i;
	};

};
