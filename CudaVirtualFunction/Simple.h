#pragma once
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
class Simple
{
public:
	__device__  Simple() {};

	__device__ void Justtest(int *max, int *res) {
		SimpleCouter(max, res);
		res[0] = 99;
	};
	__device__ virtual void SimpleCouter(int *max, int *res) {};

	__device__ ~Simple() {};
};

