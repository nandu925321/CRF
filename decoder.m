% Steps
% 1. Load the data set into X, W and T 
% 2. Implement the brute force solution.
% TODO: 3. Plot the given data to create ground truth and check for consistency
% 4. Implement the max-sum algorithm 

% We use fscanf in MatLab to read a file 

fileID = fopen('decode_input.txt','r');
formatSpec = '%f';       
data = fscanf(fileID,formatSpec);
fclose(fileID);
#name = "enumerate.dat";
#brute = csvread(name);

% Load X from data
x  = data(1:12800);
x = reshape(x,[128,100]);
x = x.';

data(1:12800) = []; # removed seperated values

% Load W from data 

W = data(1:3328); # 26*128 rows
W = reshape(W,[128,26]);
W = W.';

% load T from data
data(1:3328) = [];
T = data(1:676);
T = reshape(T,[26,26]);

% implement max-sum approach
pointers = zeros(100,26);
max_pointers = zeros(100,26);

for i = 1:26
  max_pointers (1,i) = dot(W(i,:),x(1,:));
end
max_pointers;
for i = 2:100
  for j = 1:26
    previous = max_pointers(i-1,:);
    for k = 1:26
      previous(k) = previous(k) + T(k,j);
    
    [max_value,argm] = max(previous);
    pointers(i,j) = argm;
    max_pointers(i,j) = previous(argm) + dot(W(j,:),x(i,:));
    end
  end
 end
word = zeros (100,1);
#ax_pointers(100);
[value,argmax] = max(max_pointers(100,:));
word(100) = argmax;

for i =100:-1:2
  word(i-1) = pointers(i,word(i));
  end
word,value
fileID = fopen('decode_output.txt','wt');
fprintf(fileID,"%d\n",word);
  

    
  




    
    
      
    
    
  







 