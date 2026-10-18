local CONFIG = {
    mode = "url",
    url = "https://raw.githubusercontent.com/emil768YT/emil768test_script/refs/heads/main/obusification_script",
    file = "my-script-obfuscated.luau",
}
local Players=game:GetService("Players")
local TweenService=game:GetService("TweenService")
local RunService=game:GetService("RunService")
local env=getgenv()
local bridgeKey="__EMIL768_LOAD_PROGRESS_V1"
if type(env[bridgeKey])=="table" and env[bridgeKey].active then
    warn("[EMIL768 loader] A script is already loading.")
    return
end
local player=Players.LocalPlayer
if not player then warn("[EMIL768 loader] LocalPlayer is unavailable.");return end
local gui=Instance.new("ScreenGui")
gui.Name="Emil768_Loading";gui.ResetOnSpawn=false;gui.IgnoreGuiInset=true;gui.DisplayOrder=10001
gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
local parentOk=pcall(function()gui.Parent=game:GetService("CoreGui")end)
if not parentOk then gui.Parent=player:WaitForChild("PlayerGui")end
local shade=Instance.new("Frame")
shade.Size=UDim2.fromScale(1,1);shade.BackgroundColor3=Color3.new(0,0,0);shade.BackgroundTransparency=.45
shade.BorderSizePixel=0;shade.Active=true;shade.Parent=gui
local card=Instance.new("Frame")
card.AnchorPoint=Vector2.new(.5,.5);card.Position=UDim2.fromScale(.5,.5)
card.Size=UDim2.new(.9,0,0,138);card.BackgroundColor3=Color3.fromRGB(24,17,22)
card.BorderSizePixel=0;card.Parent=shade
local maxWidth=Instance.new("UISizeConstraint");maxWidth.MaxSize=Vector2.new(410,230);maxWidth.Parent=card
local corner=Instance.new("UICorner");corner.CornerRadius=UDim.new(0,16);corner.Parent=card
local stroke=Instance.new("UIStroke");stroke.Color=Color3.fromRGB(102,66,82);stroke.Transparency=.3;stroke.Parent=card
local accent=Color3.fromRGB(240,157,186)
local function label(name,text,x,y,w,h,size)
    local o=Instance.new("TextLabel");o.Name=name;o.Text=text;o.BackgroundTransparency=1
    o.Position=UDim2.fromOffset(x,y);o.Size=UDim2.new(1,w,0,h)
    o.Font=Enum.Font.GothamMedium;o.TextSize=size;o.TextColor3=Color3.fromRGB(239,230,234)
    o.TextXAlignment=Enum.TextXAlignment.Left;o.TextWrapped=true
    o:SetAttribute("StreamerPrivacyIgnore",true);o.Parent=card;return o
end
label("Title","EMIL768",22,16,-44,28,20)
local status=label("Status","Preparing loader...",22,52,-102,40,12)
local percent=label("Percent","0%",0,56,-22,28,17)
percent.TextXAlignment=Enum.TextXAlignment.Right;percent.TextColor3=accent
local track=Instance.new("Frame")
track.Position=UDim2.fromOffset(22,105);track.Size=UDim2.new(1,-44,0,7)
track.BackgroundColor3=Color3.fromRGB(58,39,48);track.BorderSizePixel=0;track.Parent=card
local tc=Instance.new("UICorner");tc.CornerRadius=UDim.new(1,0);tc.Parent=track
local fill=Instance.new("Frame")
fill.Name="ProgressFill";fill.Size=UDim2.fromScale(0,1);fill.BackgroundColor3=accent
fill.BorderSizePixel=0;fill.Parent=track
local fc=Instance.new("UICorner");fc.CornerRadius=UDim.new(1,0);fc.Parent=fill
local errorLabel=label("Error","",22,124,-44,58,10)
errorLabel.Visible=false
errorLabel.TextColor3=Color3.fromRGB(220,165,172)
local close=Instance.new("TextButton")
close.Name="Close";close.Text="Close";close.Visible=false;close.Position=UDim2.new(1,-104,1,-35)
close.Size=UDim2.fromOffset(82,25);close.Font=Enum.Font.GothamMedium;close.TextSize=12
close.TextColor3=accent;close.BackgroundTransparency=1;close.Parent=card
local shown,tween,finished=0,nil,false
local session={active=true,checkpointSeen=false}
local function update(value,text)
    if not gui.Parent then return end
    value=math.clamp(math.floor(value),shown,100);shown=value
    percent.Text=tostring(value).."%";status.Text=text
    if tween then tween:Cancel()end
    tween=TweenService:Create(fill,TweenInfo.new(.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.fromScale(value/100,1)})
    tween:Play()
end
local function release()
    session.active=false
    if env[bridgeKey]==session then env[bridgeKey]=nil end
end
local function destroy()
    release()
    if tween then tween:Cancel()end
    gui:Destroy()
end
local closeConnection=close.Activated:Connect(destroy)
gui.Destroying:Connect(function()release();closeConnection:Disconnect()end)
local stageNames={
    [0]="Initializing services...",[6]="Loading theme...",[12]="Creating interface...",
    [22]="Creating controls...",[32]="Styling interface...",[44]="Loading settings...",
    [53]="Loading search...",[60]="Loading player lists...",[65]="Loading features...",
    [72]="Loading MM2 modules...",[82]="Loading privacy settings...",
    [90]="Loading screen buttons...",[95]="Loading keybind window...",[100]="Initialization complete",
}
session.report=function(value,text)
    if finished or not session.active or type(value)~="number" or value~=value then return end
    session.checkpointSeen=true
    update(20+math.floor(math.clamp(value,0,100)*.79),stageNames[value] or "Initializing script...")

    RunService.Heartbeat:Wait()
end
env[bridgeKey]=session
local ok,failure=xpcall(function()
    update(0,"Preparing source...");RunService.Heartbeat:Wait()
    local source
    if CONFIG.mode=="url"then
        if CONFIG.url==""then error("CONFIG.url is empty.",0)end
        if not CONFIG.url:match("^https://")then error("CONFIG.url must start with https://",0)end
        update(3,"Downloading script...")
        source=game:HttpGet(CONFIG.url)
    elseif CONFIG.mode=="file"then
        if type(readfile)~="function"then error("This executor does not support readfile.",0)end
        update(3,"Reading script file...")
        source=readfile(CONFIG.file)
    else error('Invalid CONFIG.mode. Expected "url" or "file".',0)end
    if type(source)~="string"or source:match("^%s*$")then error("The source returned empty code.",0)end
    update(12,"Compiling script...");RunService.Heartbeat:Wait()
    if type(loadstring)~="function"then error("This executor does not support loadstring.",0)end
    local chunk,compileError=loadstring(source,"EMIL768 obfuscated script")
    if not chunk then error("Compilation error: "..tostring(compileError),0)end
    source=nil
    update(20,"Starting script...");RunService.Heartbeat:Wait()
    chunk()
end,function(err)return tostring(err)end)
finished=true;release()
if ok then
    update(100,"Script loaded")
    task.delay(.7,destroy)
else
    status.Text="Loading failed";status.TextColor3=Color3.fromRGB(255,125,137)
    errorLabel.Text=tostring(failure):sub(1,260);errorLabel.Visible=true;close.Visible=true
    card.Size=UDim2.new(.9,0,0,230)
    warn("[EMIL768 loader] "..tostring(failure))
end
