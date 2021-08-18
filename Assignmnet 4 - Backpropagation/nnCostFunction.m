function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

X = [ones(m,1) X];
yVec = zeros(length(y),num_labels);
for(i =1:length(y))
    yVec(i,y(i)) = 1;
end

Gamma2 = zeros(size(Theta2));
Gamma1 = zeros(size(Theta1));

for(i = 1:m)
   a1 = X(i,:); % 1x(m+1)
   z2 = Theta1*(a1'); % hiddenx(m+1) * (m+1)x1 = hiddenx1
   a2 = sigmoid(z2);  % hiddenx1
   z3 = Theta2*[1;a2]; % num_label x (hidden+1) * (hidden+1)x1 % add bias term
   a3 = sigmoid(z3); % num_labelx1
   J = J +sum(-yVec(i,:)'.*log(a3)-(1-yVec(i,:)').*log(1-a3));
   
   % Backpropagation
   
   delta3 = a3 - (yVec(i,:)'); % numlabelx1
   Gamma2 = Gamma2 + delta3*([1;a2]'); % numlabelx1 * 1x(hidden+1)
   
   delta2 = (Theta2(:,2:end)')*delta3 .*sigmoidGradient(z2); % hiddenxnumlabel * numlabelx1 .*
   Gamma1 = Gamma1 + delta2*(a1); % hiddenx1 * 1x(m+1)
   
end
J = J/m;
regOffset = 0.5*lambda/m*(sum(sum(Theta1(:,2:end).^2))+sum(sum(Theta2(:,2:end).^2)));
J = J + regOffset;

Theta1_grad = Gamma1./m + lambda/m*[zeros(hidden_layer_size,1) Theta1(:,2:end)];
Theta2_grad = Gamma2./m + lambda/m*[zeros(num_labels,1) Theta2(:,2:end)];

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
