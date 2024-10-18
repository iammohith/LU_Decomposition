# LU Decomposition

## Overview

This repository contains a MATLAB implementation of **LU Decomposition**, a method used for solving systems of linear equations, computing matrix inverses, and finding determinants. The algorithm decomposes a square matrix **A** into a lower triangular matrix **L** and an upper triangular matrix **U**, facilitating efficient solutions to linear systems.

## Files

- `LU_Decomposition.m`: The main MATLAB function implementing the LU Decomposition algorithm. It takes a square coefficient matrix **A** and a constants vector **B**, and returns the solution vector **X**, along with matrices **L** and **U**.

## How It Works

### Methodology

1. **Decomposition**: The algorithm splits matrix **A** into **L** and **U** such that:
   \[
   A = LU
   \]
   
2. **Forward Substitution**: Solves the equation \(LC = B\) for intermediate vector **C**.

3. **Backward Substitution**: Solves the equation \(UX = C\) for the final solution vector **X**.

### Function Signature
```matlab
[X, L, U] = LU_Decomposition(A, B)
```
- **A**: Input square matrix (coefficient matrix).
- **B**: Input column vector (constants).
- **X**: Output solution column vector.
- **L**: Lower triangular matrix.
- **U**: Upper triangular matrix.

## Example Usage

```matlab
% Example coefficient matrix A and constants vector B
A = [4, 2, 1;
     2, 3, 1;
     1, 1, 2];

B = [1; 2; 3];

% Solve using LU Decomposition
[X, L, U] = LU_Decomposition(A, B);

% Display results
disp('Solution X:');
disp(X);
disp('Lower triangular matrix L:');
disp(L);
disp('Upper triangular matrix U:');
disp(U);
```

## Prerequisites

- **MATLAB** (preferably R2018b or later)
- Basic understanding of linear algebra concepts.

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/iammohith/LU_Decomposition-in-MATLAB.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd LU_Decomposition-in-MATLAB
   ```

3. **Open the `LU_Decomposition.m` script in MATLAB:**
   - Launch MATLAB and navigate to the project folder.
   - Open `LU_Decomposition.m` to run the algorithm or modify it as needed.

## Acknowledgements

- MATLAB Documentation for providing comprehensive resources on matrix operations and numerical methods.
- Various online resources and textbooks on numerical linear algebra for foundational concepts.

## References

1. **MATLAB Documentation**  
   [https://www.mathworks.com/help/matlab/](https://www.mathworks.com/help/matlab/)

2. **Numerical Methods for Engineers, 8th Edition**  
   *Steven C. Chapra, Raymond P. Canale*  
   ISBN: 978-0073397924

## Contributing

Contributions are welcome! Feel free to fork this repository, make improvements, and submit a pull request.

## License

This project is open source and available under the [MIT License](LICENSE).
