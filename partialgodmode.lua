--similar to the anchoring tool, but you can move freely.
--any other touch-dependent exploits will be disabled while this is on.
--ex: humanoid-sit 
if _G.notouch then _G.notouch:Disconnect() end
--if _G.notouch2 then _G.notouch2:Disconnect() end 
local lp = game.Players.LocalPlayer
local blocker, enabled
if game.CoreGui:FindFirstChild"notouch" then game.CoreGui.notouch:Destroy() end
local new = Instance.new("ScreenGui", game.CoreGui)
new.Name = "notouch"
local remotePress = Instance.new("TextButton", new)
remotePress.Name = "touchAll"
remotePress.BackgroundColor3 = Color3.new(0.333333, 0.333333, 0.333333)
remotePress.Size = UDim2.new(0, 150, 0, 25)
remotePress.Font = Enum.Font.SourceSans
remotePress.Text = "notouch: DISABLED"
remotePress.TextColor3 = Color3.new(1, 1, 1)
remotePress.TextScaled = true
remotePress.TextSize = 14
remotePress.TextWrapped = true
remotePress.Position = UDim2.new(0, 0, 0.95, -110)
remotePress.MouseButton1Click:Connect(function()
    enabled = not enabled
    remotePress.Text = 'notouch: '..(enabled and 'ENABLED' or 'DISABLED')
    if lp.Character then for i,v in pairs(lp.Character:GetDescendants()) do if v:IsA"BasePart" and not v:FindFirstAncestorOfClass"Tool" then if enabled then v.CanTouch = false else v.CanTouch = true end end end end
    for i,v in pairs(workspace:GetDescendants()) do if v:IsA"BasePart" then if enabled then v.CanTouch = false else v.CanTouch = true end end end
end)
_G.notouch = workspace.DescendantAdded:Connect(function(v)
    if enabled and v:IsA"BasePart" then v.CanTouch = false end
end)