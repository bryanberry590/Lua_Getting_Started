-- This creates the class table
local Person = {}
-- This enables method inheritance
Person.__index = Person

-- '.' is for a static method
function Person.new(name, age)
    local self = setmetatable({}, Person)
    self._name = name
    self._age = age
    return self
end

-- ':' automatically passes in self, good for getters so we can access self variables
function Person:getName()
    return self._name
end

function Person:getAge()
    return self._age
end

function Person:setName(name)
    -- not equals uses '~=''
    if name ~= "" then
        self._name = name
    else
        error("Name is invalid")
    end
end

function Person:setAge(age)
    -- comparing a variable to a type
    if type(age) == "number" then
        self._age = age
    else
        error("Age is invalid")
    end
end

function Person:toString()
    return "Name: ", self._name, " Age: ", self._age
end

-- returning the class name here allows us to import it elsewhere
return Person