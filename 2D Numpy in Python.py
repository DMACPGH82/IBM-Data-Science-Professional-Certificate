import numpy as np
import matplotlib.pyplot as plt

## Create a 2D Numpy Array

# Create a list
a = [[11, 12, 13], [21, 22, 23], [31, 32, 33]]
a
print ("List is 'a' is the following: ")
print (a)
print ("")


# We can cast the list to a Numpy Array as follows:
# Convert list to Numpy Array
# Every element is the same type
A = np.array(a)
A
print ("The Numpy Array is the following: ")
print (A)
print ("")


# We can use the attribute ndim to obtain the number of axes or dimensions, referred to as the rank.
# Show the numpy array dimensions
A.ndim
print ("the dimensions of the array is ")
print (A.ndim)
print ("")

# Attribute shape returns a tuple corresponding to the size or number of each dimension.
# Show the numpy array shape
A.shape
print ("The shape of the array is ")
print (A.shape)
print("")


# The total number of elements in the array is given by the attribute size.
# Show the numpy array size
A.size
print ("This size of the arrays is ")
print (A.size)
print ("")


## Accessing different elements of a Numpy Array
## We can use rectangular brackets to access the different elements of the array.

# Access the element on the second row and third column
A[1, 2]
print("The element on the second row and third column of the array using A[X,Y] is: ")
print (A[1,2])
print("")


# Access the element on the second row and third column
A[1][2]
print ("The element on the second row and third column of the array using A[X][Y] is: ")
print(A[1][2])
print ("")


# Access the element on the first row and first column
A[0][0]
print ("The element on the first row and first column of the array using A[X][Y] is: ")
print (A[0][0])
print ("")


# Access the element on the first row and first and second columns
A[0][0:2]
print ("The element on the first row and first and second columns of the array using A[X][Y:N] is: ")
print (A[0][0:2])
print ("")


# Access the element on the first and second rows and third column
A[0:2, 2]
print ("the element on the first and second rows and third column of the array using A[X:N, Y] is: ")
print (A[0:2, 2])
print ("")


## Basic Operations
## We can also add arrays. The process is identical to matrix addition.

print("We can also add arrays. The process is identical to matrix addition.")
# Create a numpy array X
X = np.array([[1, 0], [0, 1]]) 
X
print ("The numpy array X is: ")
print (X)
print ("")


# Create a numpy array Y
Y = np.array([[2, 1], [1, 2]]) 
Y
print ("The numpy array Y is: ")
print (Y)
print ("")


# Add X and Y
Z = X + Y
Z
print ("the sum of numpy Array X and numpy Array Y is Z and Z equals: ")
print (Z)
print ("")


print("We can also multiply arrays. The process is identical to matrix addition.")
# Create a numpy array Y
Y = np.array([[2, 1], [1, 2]]) 
Y
print ("The numpy array Y is: ")
print (Y)
print ("")

# Create a numpy array X
X = np.array([[1, 0], [0, 1]]) 
X
print ("The numpy array X is: ")
print (X)
print ("")


# Multiply X with Y
Z = X * Y
Z
print ("The product of numpy X and numpy Y is Z and Z equals: ")
print (Z)
print ("")


print ("We can also perform matrix multiplication with the numpy arrays A and B as follows: ")
print ("First, we define matrix A and B: ")

# Create a matrix A
A = np.array([[0, 1, 1], [1, 0, 1]])
A
print ("Matrix A is: ")
print (A)
print ("")

# Create a matrix B
B = np.array([[1, 1], [1, 1], [-1, 1]])
B
print ("Matrix B is: ")
print (B)
print ("")

print ("We use the numpy function dot to multiply the arrays together")
# Calculate the dot product
Z = np.dot(A,B)
Z
print ("The dot product of Matrix A and Matrix B is dot Product Z which is: ")
print (Z)
print ("")


# Calculate the sine of Z
np.sin(Z)
print ("The sine of Z is: ")
print (np.sin(Z))
print ("")


print ("We use the numpy attribute T to calculate the transposed matrix")
# Create a matrix C
C = np.array([[1,1],[2,2],[3,3]])
C
print ("Matrix C is: ")
print ("")

# Get the transposed of C
C.T
print ("The transposed of C is: ")
print (C.T)
print("")


print ("Quiz on 2D Numpy Array")
print ("Consider the following list a, convert it to Numpy Array: b = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]")
b = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
B = np.array(b)
B
print ("The Numpy Array is the following: ")
print (B)
print ("")


print ("Calculate the numpy array size")
B.size
print ("This size of the arrays is ")
print (B.size)
print ("")


print ("Access the element on the first row and first and second columns")
B[0][1]
print ("The element on the second row and third column of the array using B[X][Y] is: ")
print(B[0][0:2])
print ("")


print ("Perform matrix multiplication with the numpy arrays B and C")
C = np.array([[0, 1], [1, 0], [1, 1], [-1, 0]])
D = np.dot(B,C)
D
print ("The dot product of Matrix A and Matrix B is dot Product D which is: ")
print (D)
print ("")
