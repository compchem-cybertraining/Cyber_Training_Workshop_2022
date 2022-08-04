def build_equation(dimensions, slice):
    '''
    slice is in the format [axis, point] and represents the hyperplane you want to look at.
    
    This format makes things a few lines simpler.
    
    
    
    '''


    # Create initial structure of terms
    terms = ''

    # Builds an expression of the form N[x]*N[x-1]*N[x-2]*...*N[1]* where  x = dimensions - 1
    # Notice the error above with * at the end
    for i in range(dimensions - 1, 0, -1):

        terms += 'N[' + str(i) + ']*'

    # Correcting for * error 
    terms = terms[0:-1:] 
    
    
    eq = ''

    for i in range(dimensions):

        # Builds and expression of the form C[0]*N[x]*N[x-1]*N[x-2]*...*N[1]
        eq += 'C[' + str(i) + ']*' + terms + '+'

        # Removes the smallest term in the string eg: N[5]*N[4]*N[3]*N[2] -> N[5]*N[4]*N[3]
        # The reasoning stems from the derivation of the general form
        terms = terms[0:-len('*N[' + str(i+1) + ']')]

        # Builds the final equation that is used to run the calculation
        expression = 'sol.append(' + \
        eq[0:-2].replace('C[' + str(slice[0]) + ']', str(slice[1])) + ')'  

    return expression

def calculate(sol, dimensions, expression, index, C, N, current = 0, key = 0):
    '''
    The main calculation function

    sol is the list that contains all of the points from the output


    N is the grid size in the form of a list. 

    N = [N0, N1, N2, ... , Nn-1]

    Create Coefficient Dictionary in the following way:

    C = {x : 0 for x in range(len(N))}


    '''

    # Used to check whether the last index is the one in question
    # Fixes an index error. 
    if key == index and index == dimensions - 1:

        exec(expression)

    # Prevents iteration over a fixed index. 
    elif key == index:

        # Keeps track of position in the list
        current += 1 

        # Calls itself to iterate over the next index
        calculate(sol, dimensions, expression, index, C, N, current, key + 1)

    # Checks if on last index and calculates the terms. 
    # This is the final step in a recursive branch if index != dimensions - 1
    elif key == dimensions - 1 and current == dimensions - 1: 
        
        for C[key] in range(N[key]): 

            exec(expression)

        # Keeps track of position in the list
        current -= 1

    else:

        # Keeps track of position in the list
        current += 1

        # Recursion to iterate over the next index. 
        for C[key] in range(N[key]):

            calculate(sol, dimensions, expression, index, C, N, current, key + 1)


'''
Example: 
slice = [3, 4]

dim = 4

exp = build_equation(dim, slice)

output = []

grid = [6, 9, 8, 7]

coefficients = {x : 0 for x in range(len(grid))}

calculate(output, dim, exp, slice[0], coefficients, grid)

print(output)

'''

# These two functions can definitely be merged into one function, I separated them in the event that someone wanted to modify either. 