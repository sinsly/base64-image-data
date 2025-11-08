--[[

    Author: sinsly
    License: MIT
    Github: https://github.com/sinsly

--]]

-- IMAGES: the direct links to your images (GitHub raw image file)
-- SAVE_FOLDER: the local folder where images will be stored
-- when calling your image it will be target.Image = ASSET_PATHS. then image name ex: ASSET_PATHS.sins
-- only useful purpose i see for this is custom images for ui libs, or just bypassing

local IMAGES = {
    sins = "https://raw.githubusercontent.com/sinsly/base64-image-data/main/images/sins.png",
    image2 = ",
}
local SAVE_FOLDER = "Images"


local CoreGui = game:GetService("CoreGui")

local function sanitizeFilename(name)
    return name:gsub("[^%w%._%-]", "_")
end

local function downloadFile(url)
    if type(syn) == "table" and type(syn.request) == "function" then
        local ok, res = pcall(function() 
            return syn.request({Url = url, Method = "GET"})
        end)
        if ok and type(res) == "table" and res.Body and #tostring(res.Body) > 0 then
            return true, res.Body
        end
    end

    local ok, body = pcall(function() return game:HttpGet(url) end)
    if ok and body and #tostring(body) > 0 then
        return true, body
    end

    return false, body
end

local function ensureFolder(folder)
    if type(isfolder) == "function" and not isfolder(folder) then
        pcall(makefolder, folder)
    end
end


local ASSET_PATHS = {} 

ensureFolder(SAVE_FOLDER)

for name, url in pairs(IMAGES) do
    local filename = sanitizeFilename(name) .. ".png"
    local filepath = SAVE_FOLDER .. "/" .. filename

    print("Downloading:", url)
    local ok, body = downloadFile(url)
    if ok then
        local writeOk, writeErr = pcall(function() writefile(filepath, body) end)
        if writeOk then
            ASSET_PATHS[name] = "rbxasset://" .. filepath
            pcall(function() showImage(filepath) end)
            print("Saved and loaded:", name, "->", filepath)
        else
            warn("Failed to write file:", writeErr)
        end
    else
        warn("Failed to download:", url)
    end
end


-- this is just a debug test showcase and not important you can remove this 
    local screenGui = Instance.new("ScreenGui", CoreGui)
    screenGui.Name = "ImageShowcase"
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 1000

    local imageLabel = Instance.new("ImageLabel", screenGui)
    imageLabel.Size = UDim2.new(0.5, 0, 0.5, 0)
    imageLabel.Position = UDim2.new(0, 0, 0, 0)
    imageLabel.BackgroundTransparency = 1
    imageLabel.BorderSizePixel = 0
    imageLabel.ScaleType = Enum.ScaleType.Fit
    imageLabel.Image = ASSET_PATHS.sins


