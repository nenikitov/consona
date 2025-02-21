-- Sample lua code

local a = 10
local sum = a + 20
local message = "Hello, Lua!"
local test = a and 10 or 20
X = 100
Y = 200

local function factorial(n)
    if n == 0 then
        return 1
    end
    return n * factorial(n - 1)
end

print("Factorial of 5 is " .. factorial(5))

local multiply = function(x, y)
    return x * y
end

if a > X then
    print("a is greater than b")
elseif a < X then
    print("a is less than b")
else
    print("a is equal to b")
end

for i = 1, 5 do
    print("Numeric for loop, iteration: " .. i)
end

local fruits = {"apple", "banana", "cherry"}
for _, fruit in ipairs(fruits) do
    print("Fruit: " .. fruit)
end

local i = 1
while i <= 3 do
    print("While loop iteration: " .. i)
    i = i + 1
end

local j = 1
repeat
    print("Repeat loop iteration: " .. j)
    j = j + 1
until j > 3

local arr = {10, 20, 30, 40, 50}
for i, v in ipairs(arr) do
    print("Array element at index " .. i .. " is " .. v)
end

local person = {
    name = "John",
    age = 30,
    occupation = "Developer"
}
print("Person name: " .. person.name)

local employee = {
    name = "Jane",
    details = { age = 25, occupation = "Designer" }
}
print("Employee name: " .. employee.name .. ", occupation: " .. employee.details.occupation)

local t = {}
local mt = {
    __index = function(table, key)
        return "Key '" .. key .. "' does not exist!"
    end
}
setmetatable(t, mt)
print(t.unknown_key)
local Car = {}
Car.__index = Car
function Car:new(model, year)
    local self = setmetatable({}, Car)
    self.model = model
    self.year = year
    return self
end
function Car:display()
    print("Car model: " .. self.model .. ", Year: " .. self.year)
end

local myCar = Car:new("Tesla", 2024)
myCar:display()  -- Method call with colon `:`

local sum2 = 5 + 3
local product = 5 * 3
local division = 5 / 2
local mod = 5 % 2
print("5 == 3: " .. tostring(5 == 3))
print("5 ~= 3: " .. tostring(5 ~= 3))
print("5 > 3: " .. tostring(5 > 3))
print("5 > 3 and 3 > 2: " .. tostring(5 > 3 and 3 > 2))
print("5 > 3 or 3 < 2: " .. tostring(5 > 3 or 3 < 2))
print("not (5 < 3): " .. tostring(not (5 < 3)))

local var = nil

local function safe_divide(x, y)
    if y == 0 then
        error("Division by zero!")
    end
    return x / y
end

local status, result = pcall(safe_divide, 10, 0)
if not status then
    print("Error: " .. result)
else
    print("Result: " .. result)
end

local function my_coroutine()
    for i = 1, 3 do
        print("Coroutine iteration: " .. i)
        coroutine.yield()
    end
end

local co = coroutine.create(my_coroutine)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)

--- This is a LuaDoc comment block.
-- It describes the function below.
-- @param x The first parameter
-- @param y The second parameter
-- @return The sum of x and y
local function add_numbers(x, y)
    return x + y
end

local math = require("math")
print("Square root of 16: " .. math.sqrt(16))

local numbers = {5, 2, 8, 3, 1}
table.sort(numbers)
table.insert(numbers, 4)
table.remove(numbers, 1)
local nums = {1, 2, 3}
local str = table.concat(nums, ", ")

local file = io.open("test.txt", "w")
