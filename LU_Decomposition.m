function [X, L, U] = LU_Decomposition(A, B)
    % LU_Decomposition: Solves the system AX = B using LU Decomposition
    % A - Input square matrix (coefficient matrix)
    % B - Input column vector (constants)
    % X - Output solution column vector
    % L - Lower triangular matrix
    % U - Upper triangular matrix

    %% Check if matrix A is square
    [m, n] = size(A);
    if m ~= n
        error('Coefficient matrix A must be square.');
    end
    
    % Check if the dimensions of A and B are compatible
    if m ~= length(B)
        error('Coefficient matrix A and vector B must have compatible dimensions.');
    end
    
    %% Initialization
    N = m;               % Number of rows/columns in A
    U = zeros(N, N);      % Preallocate upper triangular matrix U
    L = eye(N);           % Preallocate lower triangular matrix L as identity matrix
    X = zeros(N, 1);      % Preallocate solution vector X
    C = zeros(N, 1);      % Preallocate intermediate vector C for forward substitution
    
    format long           % Use long format for higher accuracy

    %% LU Decomposition
    % First row of U and first column of L
    U(1, :) = A(1, :);
    L(2:N, 1) = A(2:N, 1) / U(1, 1);
    
    % Compute remaining rows of U and columns of L
    for i = 2:N-1
        U(i, i:N) = A(i, i:N) - L(i, 1:i-1) * U(1:i-1, i:N);
        L(i+1:N, i) = (A(i+1:N, i) - L(i+1:N, 1:i-1) * U(1:i-1, i)) / U(i, i);
    end
    
    % Last element of U
    U(N, N) = A(N, N) - L(N, 1:N-1) * U(1:N-1, N);
    
    %% Forward Substitution (LC = B)
    % Solve for C using forward substitution: L * C = B
    C(1) = B(1);  % First element of C
    for i = 2:N
        C(i) = B(i) - L(i, 1:i-1) * C(1:i-1);
    end

    %% Backward Substitution (UX = C)
    % Solve for X using backward substitution: U * X = C
    X(N) = C(N) / U(N, N);  % Last element of X
    for i = N-1:-1:1
        X(i) = (C(i) - U(i, i+1:N) * X(i+1:N)) / U(i, i);
    end
end
