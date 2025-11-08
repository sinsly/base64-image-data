## custom image converter for roblox

- Rapid UI prototyping with custom images  
- Using images across multiple projects without uploading to Roblox  
- Testing custom UI elements in executor environments  

---

## Features

- Multi-image support via the `IMAGES` table  
- Automatic filename sanitization  
- Compatible with `syn.request` (Synapse) and `game:HttpGet`  
- Automatically creates the save folder if it doesn’t exist  
- Exposes images through an `ASSET_PATHS` table (e.g., `ASSET_PATHS.sins`)  
- Optional debug `ScreenGui` preview  

---

## Installation / Usage

1. Place the script in your executor environment.

2. Configure your images:

```lua
local IMAGES = {
    sins = "https://raw.githubusercontent.com/sinsly/base64-image-data/main/images/sins.png",
    image2 = "https://example.com/otherimage.png",
}
local SAVE_FOLDER = "Images"
local imageLabel = Instance.new("ImageLabel")
imageLabel.Image = ASSET_PATHS.sins
```
