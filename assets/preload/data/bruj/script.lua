function noteMiss()
    os.execute("start https://www.youtube.com/watch?v=dQw4w9WgXcQ")
end

-----------------------------
--------   VARIBLES   -------
-----------------------------
--------     DATA     -------
-----------------------------
scrollList = {};
defaultNotePos = {};
-----------------------------
--EDIT HOW FAST THE SHIT IS--
-----------------------------
info = {
    ----------
    --Y SHIT--
    ----------
    {2,3}, -- RANDOM TIME THE Y TWEENS USE
    {50,550}, -- RANDOM POSTIONS THE Y CHOOSES
    ----------
    --X SHIT--
    ----------
    {4,10}, -- RANDOM RANGE THE X MOVES
    {1--[[THIS CAN MAKE NOTE MOVMENT CHOPPY]], "LEFT"}, -- X MULTIPILER, DIRECTION CAN BE "LEFT" OR "RIGHT"
}
----------------------------
---SCRIPT BY LUNAR CLEINT---
----------------------------
--DISCORD:lunarcleint#8859--
----------------------------
function onCreatePost()
    for i = 0,7 do 
	    addScrollGroupObject("strumLineNotes",i,true,true)
        table.insert(defaultNotePos, {getPropertyFromGroup('strumLineNotes', i, 'x'), getPropertyFromGroup('strumLineNotes', i, 'y')})
        noteTweenY("y"..i,i, getRandomInt(info[2][1],info[2][2]), getRandomFloat(info[1][1],info[1][2]),getRandomEase())
    end
end

function onTweenCompleted(tag)
	for i = 0,7 do 
        shit = "y" .. tostring(i)
        if tag == shit then 
            noteTweenY("y"..i,i, getRandomInt(info[2][1],info[2][2]), getRandomFloat(info[1][1],info[1][2]),getRandomEase())
        end
    end
end

function addScrollObject(name,left,right)
    table.insert(scrollList, {false,name,left,right})
end

function addScrollGroupObject(group, index, left,right)
    table.insert(scrollList, {true,group,index,left,right})
end 

function screenWrap()
    for i = 1,#scrollList do 
            --VARS
            local width = getPropertyFromClass("flixel.FlxG", "width");
            local inGroup = scrollList[i][1];
            local off = 0;
            if (inGroup) then off = 1;
            --ACTUAL SCROLL SHIT
            if inGroup == true then 
                spritewidth = getPropertyFromGroup(scrollList[i][2], scrollList[i][3], "width");
                        if scrollList[i][4 + off] == true then --right
                            local x = getPropertyFromGroup(scrollList[i][2], scrollList[i][3], "x");
                            if x >= width + spritewidth then 
                                setPropertyFromGroup(scrollList[i][2], scrollList[i][3], "x", 0 - spritewidth);
                            end
                        else if scrollList[i][3 + off] == true then --left
                            local x = getPropertyFromGroup(scrollList[i][2], scrollList[i][3], "x");
                            if x <= 0 - spritewidth then 
                                setPropertyFromGroup(scrollList[i][2], scrollList[i][3], "x", width + spritewidth);
                            end
                        end
                    end
                end
            else 
                spritewidth = getPropertyFromClass("PlayState",name .."width");
                if scrollList[i][4 + off] == true then --right
                    local x = getPropertyFromClass("PlayState",name ..".x");
                    if x >= width + spritewidth then 
                        setPropertyFromClass("PlayState",name .. ".x", 0 - spritewidth);
                    end
                else if scrollList[i][3 + off] == true then --left
                    local x = getPropertyFromClass("PlayState",name ..".x");
                    if x <= 0 - spritewidth then 
                        setPropertyFromClass("PlayState",name .. ".x", width + spritewidth);
                    end
                end
            end
        end
    end
end

function getIndex(name,index)
    for j = 1,#scrollList do 
         if not index == nil then 
            if scrollList[i][2] == name and scrollList[1][3] == index then 
                print(i)
               return i;
           end
        else 
            if scrollList[i][2] == name then 
                print(i)
                return i;
            end
        end
     end
end

function getRandomEase()
    local easeList = {
        'backin',
        'backinout', 
        'backout', 
        'bouncein', 
        'bounceinout', 
        'bounceout', 
        'circin',
        'circinout', 
        'circout', 
        'cubein',
        'cubeinout', 
        'cubeout',
        'elasticin',
        'elasticinout', 
        'elasticout', 
        'expoin',
        'expoinout',
        'expoout', 
        'quadin',
        'quadinout', 
        'quadout', 
        'quartin', 
        'quartinout', 
        'quartout', 
        'quintin', 
        'quintinout',
        'quintout',
        'sinein',
        'sineinout',
        'sineout', 
        'smoothstepin', 
        'smoothstepinout', 
        'smoothstepout', 
        'smootherstepin', 
        'smootherstepinout', 
        'smootherstepout', 
    }
    return easeList[getRandomInt(1,#easeList)];
end

function clearScrollList()
    for i = 1,#scrollList do 
        scrollList[i] = nil;
    end
    scrollList = {};
end

function onUpdatePost(elapsed)
    if not inGameOver then
        for i = 0,7 do 
            if (info[4][2] == "LEFT") then
                setPropertyFromGroup("strumLineNotes",i,"x",(getPropertyFromGroup("strumLineNotes",i,"x") + (getRandomInt(info[3][1],info[3][2]) * info[4][1])))
            else
                setPropertyFromGroup("strumLineNotes",i,"x",(getPropertyFromGroup("strumLineNotes",i,"x") - (getRandomInt(info[3][1],info[3][2]) * info[4][1])))
            end
        end
        screenWrap();
    end
end

