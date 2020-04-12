 function [X,L,U]=LU_Decomposition(A, B)
    %% check the matrix A structure
    ms = size(A);
    if length(ms) <= 1
        error('Coeffcient matrix should be a square matrix');
    elseif ms(1)~= ms(2)
        error('Coeffcient matrix should be a square matrix');
    end
    %check the matrix B structure
    if ms(1)~= length(B)
        error('Coeffcient matrix and column matrix have different length');
    end
    
    %% define the Variable X and get the length N of X
    N=ms(1);
    U = zeros(N,N); %preallocating array for U matrix
    L = eye(N,N); %preallocating array for L matrix
    
    format long  %use long format for accraucy regardless of the sacrifice of speed
    
  %%  Start the LU decomposition 
  %the first row of U and the first column of L
     U(1,:)=A(1,:);
     L(2:N,1)=A(2:N,1)/U(1,1);
     
  % the ith row of U and the (i+1)th column of L
  for i=2:N-1 
     U(i,i:N)=A(i,i:N)- (  L(i,1:i-1)* U(1:i-1,i:N) ) ;
     L(i+1:N,i)= ( A(i+1:N, i) - ( L(i+1:N, 1:i-1)* U(1:i-1, i) ))/U(i,i) ;    
  end 
  
  % the Nth row of U
  U(N,N)=A(N,N)-L(N,1:N-1)*U(1:N-1,N); 
  
  
  %%  Substitution steps to solve for X, based on the formula LC=B, UX=C
    C=zeros(length(B),1); %preallocating array for C matrix
    X=zeros(length(B),1); %preallocating array for X matrix
  
  % Forward substitution ( LC=B )
  
    C(1)=B(1); %find C(1)
    
  for i=2:N
  C(i)=B(i)-( L(i,1:i-1)*C(1:i-1) ); %find C(i)
  
  end 
  
  % Back substitution (UX=C)
  
  X(N)=C(N)/U(N,N);  %find X(N)
  
  for i=N-1:-1:1
      
      X(i)=( C(i)-( U(i,i+1:end)*X(i+1:end)))/ U(i,i);  %find X(i)
  end 
  
 end