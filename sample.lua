-- Sample code for theme showcase
local function factorial(n)
	-- Calculate factorial for demo purposes
	if n <= 1 then
		return 1
	else
		return n * factorial(n - 1)
	end
end

-- Class definition demo
---@class Animal
---@field name string
---@field age number
local Animal = {}
Animal.__index = Animal

function Animal:new(name, age)
	local instance = setmetatable({}, Animal)
	instance.name = name
	instance.age = age
	return instance
end

function Animal:speak()
	return "Generic animal sound"
end

-- Error handling demo
local function process_data(data)
	if type(data) ~= "table" then
		error("Expected table but got " .. type(data))
	end

	local result = {}
	for key, value in pairs(data) do
		if type(value) == "number" then
			result[key] = value * 2
		elseif type(value) == "string" then
			result[key] = value:upper()
		else
			print("Warning: Unprocessable type: " .. type(value))
		end
	end

	return result
end

-- String interpolation and operators
local function format_user(user)
	local greeting = string.format("Hello %s!", user.name)
	return greeting .. " You are " .. user.age .. " years old."
end

-- Data structures
local data = {
	users = {
		{ name = "Alice", age = 30 },
		{ name = "Bob", age = 25 },
		{ name = "Carol", age = 35 },
	},
	settings = {
		theme = "dark",
		contrast = "high",
		notifications = true,
	},
}

-- Entry point function
local function main()
	print("Starting application...")

	for i, user in ipairs(data.users) do
		print(format_user(user))

		-- Conditional logic
		if user.age < 30 then
			print("User is under 30")
		else
			print("User is 30 or older")
		end
	end

	local processed = process_data({ a = 1, b = "test", c = true })
	print("Processed data:", processed)

	print("Factorial of 5:", factorial(5))

	local dog = Animal:new("Rex", 3)
	print(dog:speak())

	print("Application finished")
end

main()
