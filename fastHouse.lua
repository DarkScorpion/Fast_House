--[[
  The MIT License (MIT)
  Copyright (c) 2015 Александр Смит (https://github.com/DarkScorpion)
  
  Tortle build house from 2 material and glass panel.
  Need 3 stack of wall material,
       3 stack glass panel,
       5 stack of roof materials,
       1000 fueld in turtle.
  (!)Need place wall material in 1 slot, panel in 2, roof material in 3.
  (!)Materials to supplement slots 4-16 in any order.
]]
-- config data
local _width = 15
local _length = 19

local _slotStone = 1
local _slotGlass = 2
local _slotRoof = 3

local _fillStartSlot = 4
local _fillEndSlot = 16
-- end config data

function fillMaterial(slot)
  if turtle.getItemSpace(slot) == 0 then
    return
  end

  turtle.select(slot)
  for i=_fillStartSlot, _fillEndSlot do
    if turtle.compareTo(i) then
      if turtle.getItemCount(i) > turtle.getItemSpace(slot) then
        turtle.select(i)
        turtle.transferTo(slot, turtle.getItemSpace(slot))
        turtle.select(slot)
      else
        turtle.select(i)
        turtle.transferTo(slot, turtle.getItemCount(i))
        turtle.select(slot)
      end
      
    end --end for

    if turtle.getItemSpace(slot) == 0 then
      break
    end

  end
end -- end fillMaterial

function refillAll()
  for i=1,3 do
    fillMaterial(i)
  end
end -- end refillAll

function buildLayer1(length, width)
  
  local lengthMiddle = math.floor(length/2)+1
  local widthMiddle = math.floor(width/2)+1

  local i
  refillAll()
  
  turtle.up()
  --Left side of house
  turtle.select(_slotStone)
  for i=1, width do
    if i ~= widthMiddle then
      turtle.placeDown()
    end

    if i ~= width then
      turtle.forward()
    end
  end

  print(turtle.getFuelLevel())
  --back side of house
  turtle.turnRight()
  for i=1, length do
    if (i~=1 and i~=lengthMiddle) then
      turtle.placeDown()
    end

    if i ~= length then
      turtle.forward()
    end
  end

  print(turtle.getFuelLevel())
  --right side of house
  turtle.turnRight()
  for i=1, width do
    
    if (i~=1 and i~=widthMiddle) then
      turtle.placeDown()
    end

    if i ~= width then
      turtle.forward()
    end

  end

  refillAll()
  print(turtle.getFuelLevel())
  --forward side of house
  turtle.turnRight()
  for i=1, length do
    if (i~=1 and i~=lengthMiddle and i~=length) then
      turtle.placeDown()
    end

    if i ~= length then
      turtle.forward()
    end
  end

  turtle.turnRight()
end -- end layer1 


function buildLayer2(length, width)
  
  local lengthMiddle = math.floor(length/2)+1
  local widthMiddle = math.floor(width/2)+1

  local i
  refillAll()

  turtle.up()
  --Left side of house
  turtle.select(_slotStone)
  for i=1, width do
    if i ~= widthMiddle then
      if (i==1 or i==widthMiddle-1 or i==widthMiddle+1 or i==width) then
        turtle.select(_slotStone)
        turtle.placeDown()
      else
        turtle.select(_slotGlass)
        turtle.placeDown()
      end
    end

    if i ~= width then
      turtle.forward()
    end
  end

  print(turtle.getFuelLevel())
  --back side of house
  turtle.turnRight()
  for i=1, length do
    if (i~=1 and i~=lengthMiddle) then
      if (i==1 or i==lengthMiddle-1 or i==lengthMiddle+1 or i==length) then
        turtle.select(_slotStone)
        turtle.placeDown()
      else
        turtle.select(_slotGlass)
        turtle.placeDown()
      end
    end

    if i ~= length then
      turtle.forward()
    end
  end

  refillAll()
  print(turtle.getFuelLevel())
  --right side of house
  turtle.turnRight()
  for i=1, width do
    
    if (i~=1 and i~=widthMiddle) then
      if (i==1 or i==widthMiddle-1 or i==widthMiddle+1 or i==width) then
        turtle.select(_slotStone)
        turtle.placeDown()
      else
        turtle.select(_slotGlass)
        turtle.placeDown()
      end
    end

    if i ~= width then
      turtle.forward()
    end

  end

  print(turtle.getFuelLevel())
  --forward side of house
  turtle.turnRight()
  for i=1, length do
    if (i~=1 and i~=lengthMiddle and i~=length) then
      if (i==1 or i==lengthMiddle-1 or i==lengthMiddle+1 or i==length) then
        turtle.select(_slotStone)
        turtle.placeDown()
      else
        turtle.select(_slotGlass)
        turtle.placeDown()
      end
    end

    if i ~= length then
      turtle.forward()
    end
  end

  turtle.turnRight()
end -- end layer2

function buildLayer3(length, width)
  
  local lengthMiddle = math.floor(length/2)+1
  local widthMiddle = math.floor(width/2)+1

  local i
  refillAll()

  turtle.up()
  --Left side of house
  turtle.select(_slotStone)
  for i=1, width do

    if (i==1 or (i>=widthMiddle-1 and i<=widthMiddle+1) or i==width) then
      turtle.select(_slotStone)
      turtle.placeDown()
    else
      turtle.select(_slotGlass)
      turtle.placeDown()
    end

    if i ~= width then
      turtle.forward()
    end
  end

  print(turtle.getFuelLevel())
  --back side of house
  turtle.turnRight()
  for i=1, length do
    if (i~=1) then
      if (i==1 or (i>=lengthMiddle-1 and i<=lengthMiddle+1) or i==length) then
        turtle.select(_slotStone)
        turtle.placeDown()
      else
        turtle.select(_slotGlass)
        turtle.placeDown()
      end
    end

    if i ~= length then
      turtle.forward()
    end
  end

  refillAll()
  print(turtle.getFuelLevel())
  --right side of house
  turtle.turnRight()
  for i=1, width do
    
    if (i~=1) then
      if (i==1 or (i>=widthMiddle-1 and i<=widthMiddle+1) or i==width) then
        turtle.select(_slotStone)
        turtle.placeDown()
      else
        turtle.select(_slotGlass)
        turtle.placeDown()
      end
    end

    if i ~= width then
      turtle.forward()
    end

  end

  print(turtle.getFuelLevel())
  --forward side of house
  turtle.turnRight()
  for i=1, length do
    if (i~=1 and i~=length) then
      if (i==1 or (i>=lengthMiddle-1 and i<=lengthMiddle+1) or i==length) then
        turtle.select(_slotStone)
        turtle.placeDown()
      else
        turtle.select(_slotGlass)
        turtle.placeDown()
      end
    end

    if i ~= length then
      turtle.forward()
    end
  end

  turtle.turnRight()
end

function buildLayer4(length, width)
  
  local lengthMiddle = math.floor(length/2)+1
  local widthMiddle = math.floor(width/2)+1

  local i
  refillAll()

  turtle.up()
  --Left side of house
  turtle.select(_slotStone)
  for i=1, width do
    
    turtle.placeDown()

    if i ~= width then
      turtle.forward()
    end
  end

  print(turtle.getFuelLevel())
  --back side of house
  turtle.turnRight()
  for i=1, length do
    if (i~=1) then
      turtle.placeDown()
    end

    if i ~= length then
      turtle.forward()
    end
  end

  refillAll()
  turtle.select(_slotStone)
  print(turtle.getFuelLevel())
  --right side of house
  turtle.turnRight()
  for i=1, width do
    
    if (i~=1) then
      turtle.placeDown()
    end

    if i ~= width then
      turtle.forward()
    end

  end

  print(turtle.getFuelLevel())
  --forward side of house
  turtle.turnRight()
  for i=1, length do
    if (i~=1 and i~=length) then
      turtle.placeDown()
    end

    if i ~= length then
      turtle.forward()
    end
  end

  turtle.turnRight()
end -- endLayer4

function buildRoof(length, width)
  
  turtle.up()

  refillAll()
  turtle.select(_slotRoof)
  local isRight = true
  for i=1, length do
    
    for j=1, width do
      turtle.placeDown()
      if j~= width then
        turtle.forward()
      end
    end -- end for (j)

    if isRight then
      turtle.turnRight()
      turtle.forward()
      turtle.turnRight()
      isRight = false
    else
      turtle.turnLeft()
      turtle.forward()
      turtle.turnLeft()
      isRight = true
    end
    refillAll()
    turtle.select(_slotRoof)
  end --end for (i)

end -- end roof

--main build function
function buildHouse(length, width)
  
  print(turtle.getFuelLevel())
  
  if (length%2~=1 or width%2~=1) then
    print("Length and width must not be a multiple of 2 value")
    return
  end
  
  buildLayer1(length, width)
  buildLayer2(length, width)
  buildLayer3(length, width)
  buildLayer4(length, width)
  buildRoof(length, width)

end -- end buildHouse

--start point
buildHouse(_length, _width)
