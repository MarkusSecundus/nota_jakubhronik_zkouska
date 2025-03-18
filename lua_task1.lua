practiceLoops = {
function(N) 
    for t = 0, N do
        print(t)
    end
end,
function(N)
    for t = 0, N, 2 do
        print(t)
    end
end,
function(N)
    for t = N, 0, -1 do
        print(t)
    end
end
}

practiceArrays = {
    function(arr)
        local sum = 0
        for _ , num in ipairs(arr) do
            sum = sum + num
        end
        return sum
    end,
    function(arr)
        local max = null
        local maxIndex = -1
        for i, num in ipairs(arr) do
            if max == null or num > max then
                max = num
                maxIndex = i
            end
        end
        return maxIndex
    end,
    function(N)
        local ret = {}
        for t = 1, N do
            ret[t] = t*t
        end
        return ret
    end,
    function(arr, N)
        local i = 0
        for _, num in ipairs(arr) do
            if (num % 2) == 0 then
                i = i + 1
                if i == N then return num end
            end
        end
        return null
    end
}

practiceArraysVsTables = {
    function(arr)
        for i,e in ipairs(arr) do
            print(string.format("%s: %s", i, e))
        end
    end,
    function(tbl)
        for i,e in pairs(tbl) do
            print(string.format("'%s': %s", i, e))
        end
    end,
    function(arr)
        return #arr
    end,
    function(tbl)
        ret = 0
        for _,_ in pairs(tbl) do
            ret = ret + 1
        end
        return ret;
    end,
    function(arr)
        return #arr <= 0
    end,
    function(tbl)
        for _,_ in pairs(tbl) do
            return false
        end
        return true
    end
}

practiceTablesInBasicApplications = {
    debugDump = function(o)
        if type(o) == "table" then
            local array_keys = {}
            local ret = null
            --first dump all the array elements
            for i, item in ipairs(o) do
                array_keys[i] = true
                item_repr = practiceTablesInBasicApplications.debugDump(item)
                if ret == null then ret = item_repr else ret = string.format("%s, %s", ret, item_repr) end
            end
            -- now dump all the elements that we didn't go through when iterating the object as an array
            for key, val in pairs(o) do
                if array_keys[key] ~= true then
                    entry_repr = string.format("[%s] = %s", practiceTablesInBasicApplications.debugDump(key), practiceTablesInBasicApplications.debugDump(val))
                    if ret == null then ret = entry_repr else ret = string.format("%s, %s", ret, entry_repr) end 
                end
            end
            return string.format("{ %s }", ret)
        end
        if type(o) == "string" then
            return string.format('"%s"', o)
        end
        return string.format("%s", o)
    end,
    filter = function(arr, predicate)
        ret = {}
        for _,e in ipairs(arr) do
            if predicate(e) then 
                ret[#ret + 1] = e
            end
        end
        return ret
    end
}


o = { true, "Dsadsa", {1, 2, false}}
o.fdsfds = "dsadsa"
o[55] = 11111
o[{123, 4}] = "fdsfddf"

print(practiceTablesInBasicApplications.debugDump(o))