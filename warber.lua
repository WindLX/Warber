local function readFile(path, isHideIdx)
    local file = io.open(path, "r")
    if file ~= nil then
        local index = 0
        local length = 0
        print("File: " .. path .. "\n")
        for line in file:lines() do
            if isHideIdx == "h" then
                print(string.format("%-1s", "") .. line)
            else
                print(string.format("%-5s", index) .. line)
            end
            index = index + 1
            length = length + #line
        end
        file:close()
        print("\nTotal: " .. index .. " lines, " .. length .. " characters\n")
    else
        print("Unvalid Path\n")
    end
end

local function getArg(arg)
    os.execute("chcp 65001")
    os.execute("cls")
    if arg[1] == nil then
        print("Unvalid Path\n")
    elseif arg[2] == nil then
        readFile(arg[1])
    elseif arg[2] ~= "h" then
        print("Unvalid Arg\n")
    else
        readFile(arg[1], arg[2])
    end
end

local function run()
    getArg(arg)
end

run()
