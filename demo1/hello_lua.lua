local a = 10
a = "Hello, Lua!"

local b = 20
local function b1(b)
    if b >= 18 then
        print("成年")
    else
        if b >= 13 then
            print("青少年")
        else
            print("儿童")
        end
    end
end

local c = 30
local function c1(c)
    while c ~= 35 do
        c = c + 1
        print(c)
    end
end


local d = { 40, 50, 60 }
local function d1(d)
    for i = 1, #d do
        print(d[i])
    end
end

local e = { name = "admin", password = "123456", age = 18 }
local function e1()
    print(e.name)
end

local f = { name = "admin", password = "123456", age = 18, info = { title = "Lua", author = "admin" } }
local function f1()
    print(f.name)
    print(f.info.title)
end

local function f2()
    for key, value in pairs(f) do
        if type(value) == "table" then
            for k, v in pairs(value) do
                print(k, v)
            end
        else
            print(key, value)
        end
    end
end

local function printTable1(t)
    for key, value in pairs(t) do
        if type(value) == "table" then
            printTable1(value)
        else
            print(key, value)
        end
    end
end

local function printTable2(t, level)
    level = level or 0                     -- 默认层级为 0
    local indent = string.rep("  ", level) -- 每层缩进两个空格

    for key, value in pairs(t) do
        if type(value) == "table" then
            print(indent .. key .. ":")                     -- 打印表名
            printTable2(value, level + 1)                   -- 递归，层级 +1
        else
            print(indent .. key .. ": " .. tostring(value)) -- 打印键值
        end
    end
end

local function printTable3(t, level)
    level = level or 0
    local indent = string.rep("  ", level)

    -- 1. 将所有的 key 存入一个数组
    local keys = {}
    for k in pairs(t) do
        table.insert(keys, k)
    end

    -- 2. 对键进行排序 (Lua 的 table.sort 可以直接给数组排序)
    table.sort(keys)

    -- 3. 按排好序的 key 依次访问
    for _, k in ipairs(keys) do
        local v = t[k]
        if type(v) == "table" then
            print(indent .. k .. ":")
            printTable3(v, level + 1)
        else
            print(indent .. k .. ": " .. tostring(v))
        end
    end
end


-- print(a)
-- b1(b)
-- c1(c)
-- d1(d)
-- e1()
-- f1()
-- f2()
-- printTable1(f)
-- printTable2(f)
-- printTable3(f)

-- print(string.rep("a", 2))
-- print("hello", "lua", "!")      --中间添加一个tab
-- print("hello" .. " lua" .. "!") -- 拼接


-- print(1 and 0)
-- print(1 or 0)
-- print(1 and nil)
-- print(1 or nil)

print(tostring({}))
