#include <iostream>

__global__ void add(int *a, int *b, int *c) {
    *c = *a + *b;
}

int main() {
    int a = 1234, b = 5555, c;

    int *d_a, *d_b, *d_c;
    auto sz = sizeof(int);

    cudaMalloc(&d_a, sz);
    cudaMalloc(&d_b, sz);
    cudaMalloc(&d_c, sz);

    cudaMemcpy(d_a, &a, sz, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, &b, sz, cudaMemcpyHostToDevice);

    add<<<1, 1>>>(d_a, d_b, d_c);

    cudaMemcpy(&c, d_c, sz, cudaMemcpyDeviceToHost);

    std::cout << a << " + " << b << " = " << c << std::endl;

    // Cleanup
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);

    return 0;
}