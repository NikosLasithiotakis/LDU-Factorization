# LDU-Factorization

## Overview

This project contains an implementation of a MATLAB function that performs LDU factorization of a square matrix. LDU factorization decomposes a matrix into three matrices: a lower triangular matrix (L), a diagonal matrix (D), and an upper triangular matrix (U). If necessary, a permutation matrix (P) is also returned to reorder the rows of the input matrix A so that the factorization can be performed.

## Function Signature

```matlab
[L, D, U, P] = ldu(A);