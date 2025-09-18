-- Import the person class
-- The file name we want to import goes into require without the extension
local Person = require("person")
local Pet = require("pet")

-- Now that the person class is imported, create an instance of the class
local person1 = Person.new("Bryan", 22)

-- Test the Getters in a print statement
print("Person 1 name is ", person1:getName(), " and age is ", person1:getAge())

-- Test the Setters
person1:setAge(20)
person1:setName("Eva")
print("Changed Person 1 name and age")

-- print again after changing the instance variables
print("Person 1 name is ", person1:getName(), " and age is ", person1:getAge())

-- Use the toString defined in the person class
print("Using toString(): ", person1:toString())


-- Now lets create an instance of the pet class
local pet1 = Pet.new("Ash", 1)

-- Lets test out the toString for Pet
print("pet1 toString: ", pet1:toString())


-- Time to mess around with lua and our two classes
-- Lets see what happens when we set our person1 equal to pet 1
person1 = pet1

-- Lets call person1:toString and see what it prints
print("Calling toString() on person1: ", person1:toString())

-- We cannot call specific functions from person on the person1 object now but we can call functions only from pet.lua
-- Assigning an object instance of one class to another object from a different class will override it completely. In 
-- our case, person1 is now an instance of pet

-- What would happen if we change the name of pet1? Will pet1 and person1 share the same name?
pet1:setName("Peach")
print("Pet1 name is changed to ", pet1:getName(), ", person1 name is ", person1:getName())

-- The last thing we can check is what would happen if we change the name of person1
person1:setName("Drew")
-- Let's now print out pet1 name
print("Name of person1 is now ", person1:getName(), ", and the name of pet1 is ", pet1:getName())

-- Lets go even deeper and compare memory addresses. Lua doesn't allow us to access memory addresses but using 
-- tostring (all lowercase) and formatting it will essentially give us a memory address
print("person1 address:", string.format("%p", person1))
print("pet1 address:", string.format("%p", pet1))

-- This shows that when assigning an object of one class to an object of another class, they are literally assigned 
-- to the same spot in memory. The instance getting assigned into is overriden with what is assigned to it and becomes a 
-- copy that changes with itself. Cool stuff!