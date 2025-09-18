-- Class creation
local Pet = {}
Pet.__index = Pet

-- Constructor has to use setmetatable so that the instance being created is of type Pet here
function Pet.new(name, age)
    local self = setmetatable({}, Pet)
    self._name = name
    self._age = age
    return self
end

function Pet:getName()
    return self._name
end

function Pet:setName(name)
    if name ~= "" and type(name) == "string" then
        self._name = name
    else
        error("Invalid name")
    end
end

function Pet:toString()
    return "Pet Name: ", self._name, " Age: ", self._age
end

-- Return to be importable in other files
return Pet