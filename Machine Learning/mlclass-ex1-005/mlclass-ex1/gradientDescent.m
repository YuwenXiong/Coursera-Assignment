function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
f = length(X(1, :));
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    J_history(iter, 1) = computeCost(X, y, theta); 
    temp = zeros(length(theta), 1);
    for fea = 1: f
        for i = 1: m
            temp(fea) = temp(fea) + (X(i, :) * theta - y(i)) * X(i, fea);
        end
        temp(fea) = temp(fea) / m * alpha;
    end
    theta = theta - temp;



    % ============================================================

    % Save the cost J in every iteration    
end

end
