%% 
% Live scripts are like Markdown for R. Can combine code with visuals and text. 
% We can chain commands on one line using commas to separate them.

x = 4, y = pi/x
%% 
% We see there are now interactive output. Can still break code into sections. 
% Sections can be run independently or all sections can be run at once. Different 
% display options are available to display the output inline or on the side. We 
% can even choose to hide the code that generated the output.
% 
% Clicking on the output will show the code that generated that output. Clicking 
% on the code will likewise show the output generated.
% 
% Run button will only run code for that section. Running code for one section 
% will not change variables for other sections.
% 
% Ctrl + Enter will run code for a section
%% Matricies
% We can add formatting to text here as well. 
% 
% Scalars in MATLab are treated as 1x1 matricies.

x = 3
%% 
% We can create matricies in Matlab with square brackets.

y = [1 2]
%% 
% Values separated by spaces or commas are in the same row. Semicolons allow 
% you to create a column

rowvec = [1 2 2 12]
rowvec2 = [1,2,3,4]
colvec = [1;2]
matrix1 = [1,2;2,1]
%% 
% We can also perform calculations within the square brackets

calcvec = [2^2 abs(-pi)]
%% 
% For sequential values, we can use the : command. Notice that brackets are 
% not needed here.

rowvec = 1:6
%% 
% The : operator defaults to a spacing between numbers of 1 but we can specify 
% our own custom spacing. The middle number is the spacing.

rowvec = 1:0.5:3
%% 
% If instead we knew the first and last elements of the vector and we knew the 
% total number of elements we want (inclusive) then we can use the linspace(first, 
% last, # of elements) function

rowvec = linspace(0,1,4)
%% 
% Since both the : operator and the linspace operator create row vectors, we 
% can create column vectors instead using the transpose operator '

colvec = rowvec'
colvec2 = (1:4)'
%% 
% notice that above we require the brackets to specify the order of operations. 
% Otherwise it would take 4 transpose (which would just be 4)
% 
% rand(n) creates an nxn matrix of random numbers. We can also specify dimensions 
% to create non-square matricies. Recall that a vector is simply a matrix with 
% one column or row. randn(n) will create standard normal random numbers instead. 
% (Recall we can express any normal random variable X = mu + sd*Z). The eye() 
% function constructs the nxn identity matrix.

tworand = rand(2)
rand(2,3)
randn(1,5)
eye(4)
%% 
% zeros() and ones() will create a matrix of all 0 or 1 and functions same as 
% the rand function

ones(2)
ones(2,4)
zeros(4)
zeros(4,1)
%% 
% size() function will return the dimensions of an existing matrix. Size function 
% will return 2 dim vector of the rows and columns. We can specify whether we 
% want rows or columns by specifying an additional parameter 1 or 2 to indicate 
% just the row or column respectively. Use the length() function for vectors (with 
% col or row size of 1)

x =ones(2,4)
size(x)
size(x,1)
size(x,2)
%% 
% We can use the reshape(vec,row,col) function to turn a vector into a matrix. 
% This will fill the values of the vector into the matrix column-wise

x = 1:20
y = reshape(x,4,5)
%% 
% We can index a matrix and access its values

x = 0:2:10
x(3) % access the third index of the vector
x(3:4) % get a two-dimensional vector of the third and fourth elements of x
x([2,4]) % can also be non-consecutive
x(4) = 73 % can assign values

y = [1:5;6:10]
y(2,3)
y(2,:) % : refers to "all". So here we get all columns of second row
y(end,end) % end keyword is the last element of that dimension

%% 
% If only one index is specified for a matrix, then it will traverse down each 
% column from left to right until it reaches the specified index.
% 
% 
% 
% We can concatenate matricies with syntax similar to creating matricies. Dimensions 
% must match in order to be able to concatenate.

A = [1 2 3]
B = [4,5,6]
C = [A;B] % vertical concatenation
D = [1 ;2]
E = [C D] % horizontal concatenation

%% 
% Using the mean function on a matrix will generate a vector of column means. 
% Specifying a parameter 2 will calculate the row means. Using the (:) command 
% will change a matrix into a single vector(starting columnwise)

x = reshape(1:30,10,3)
mean(x)
mean(x,2)
mean(x(:))
%% 
% Other functions are the min and std functions
%% Matrix Math
% We can perform scalar addition and subtraction element-wise. Scalar division 
% and multiplication are also done element-wise.

x = [1,2,3]
y = [2,3,4]
x = x + 2
x = x - 2
x = x/2
x = x*2
%% 
% We can add vectors of the same size to:

z = x + y
%% 
% Can find the maximum value of a vector with the max() function. This returns 
% a scalar value

max(z)
%% 
% There are also functions of matricies that perform the funtion element-wise

sqrt(z)
round(sqrt(z),2)
%% 
% Matrix multiplication is done using the * symbol. This only works for matricies 
% with dimensions that agree. If dimensions do not agree, will return an error.  
% The .* function allows us to do element-wise matrix multiplication.

A = rand(1,2)
B = rand(2,1)
C = [1,1]
A*B
B*A % error as dimensions do not agree
A.*C
%% 
% Some other behaviour occurs when we have matricies of not necessarity equal 
% but still compatible size ( in MATLAB). Notice that spaces do not impact the 
% declaration of matricies

x = [1 2;
    3 4;
    5 6;
    7 8].*[1;2;3;4]
%% 
% 
% 
% We can create and initialize multiple variables simultaneously using vector 
% assignment

[xrow,xcol] = size(x)
xrow + xcol
%% 
% The max function also outputs a vector of length two. The first element is 
% the maximum value and the second is the index

[mval,mind] = max(B)
%% 
% If a function returns two outputs, we can extract only one of the outputs 
% by using ~. 

[mvalA,~] = max(A)

%% 
% We can invert a matrix using the inv or pinv functions for the inverse and 
% pseudoinverse respectively

x = rand(4)
xinv = pinv(x)
round(x*xinv,2)
xinv = inv(x)
round(x*xinv,2)

%% 
% We can use help function to look up functionality of a unknown function. doc 
% function will open up the documentation for a function in its own window.

help max
%doc max
%% Plots
% Create plots (lines only) with the plot function. plot(x,y). The optional 
% plot arguement will plot red dashed lines with a circle market.

plot(1:20,2+4*(1:20))
plot(1:20,2+4*(1:20), "r--o")
%% 
% We can use the "hold on" function to add a line to an existing plot. The hold 
% on command is a toggle. Any plots functions called afterward will continue adding 
% to the same plot. We need to call hold off to turn off the hold state so that 
% each plot is separate.

plot(1:20,2+4*(1:20))
hold on
plot(1:20,3+2*(1:20),"blacko")
hold off
plot(1:20,23+5*(1:20))
%% 
% If we plot a vector by itself, MATLAB will treat it as the y values in the 
% plot and automatically put 1 to n as the x values.

plot(sqrt(1:2:33))
%% 
% Can also specify pairs of additional inputs with a property name and its associated 
% value

plot(1:10,"ro-","LineWidth",3)
%% 
% Other plot functions have their own customization features.
% 
% Can add title, labels, legend, change axis limits to an existing plot with 
% the title function.

title("Red Line")
ylabel("KEKW")
xlabel("LULW")
legend("a") % one label for each line. 
title("Red" + 2 + " Line") % can also concatenate numbers and strings
xlim([0 12])
%% Importing into MATLAB
% .mat files will import all variables in the file
% 
% .jpg file will import as a numeric array of pixel values
% 
% .csv files and other text files will open up the import window to previw the 
% data to be imported. Any missing values will be NaN (not a number). A table 
% is the default import structure for data.
% 
% 
% 
% To get data from a table, use the dot notation "data.VarName"
% 
% We can assign new values to a table column in the same way as a matrix
% 
% table = sortrows(table, "varName") is used to sort a table by values in the 
% given column.
% 
% we can also use the regular dot notation to extract rows and values from a 
% table (:,end)
%% Logical Operators
% We use relational operators such as <, >, ==, ~=, <=, >=  are used to compare 
% two values. Outcome of these comparisons is either 1 or 0 (true or false)
% 
% Logical comparisons of a scalar to a matrix of vector will do the comparisons 
% element-wise and return a matrix of the same size.

1:5 > 3
%% 
% We can use logical vectors to get values from a vector

x = 1:10
y = x(x>4)
%% 
% We can use the and (&) and or (|) to combine logical comparisons
%% Simple Control Structures
% If Statement

x = -9
if x > -1
    y = sqrt(x)
end

if x > -1
    y = sqrt(x)
else 
    y = sqrt(abs(x))
    disp("negative number")
end
%% 
% elseif statement can also be used for more conditions
% For Statement
% break and continue statements can also be used in a for loop

y = 0
for i = 1:10
    y = y + i;
    pause(0.1) % pause the loop for 0.1 seconds
end
y

%% 
% Visually allow changing values by user.

s = 1

% While Loop
% Will iterate until the statement evaluates to false

x = 0
while x < 10
    x = x+2
end
%% Functions
% Functions must be declared at the end of a .m script file

addTwoNums(2,3)
%% 
% We can pass a function to another function by turning it into a function handle 
% using the @ syntax

makeSum(@addTwoNums,4,6)
%%
function sum = addTwoNums(num1,num2)
    sum = num1 + num2
end

function s = makeSum(f,x1,x2)
    s = f(x1,x2)
end

%% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
%