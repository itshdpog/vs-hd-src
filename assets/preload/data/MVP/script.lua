

function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('last');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('third');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end


--healthdrain code
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.03);
    end
end
--end of healthdrain code

	--easy script configs
	IntroTextSize = 25	--Size of the text for the Now Playing thing.
	IntroSubTextSize = 30 --size of the text for the Song Name.
	IntroSubText2Size = 20
	IntroTagColor = '1b1c1b'	--Color of the tag at the end of the box.
	IntroTagWidth = 15	--Width of the box's tag thingy.
	--easy script configs
	
	--actual script
	function onCreate()
		--the tag at the end of the box
		makeLuaSprite('JukeBoxTag', 'empty', -305-IntroTagWidth, 15)
		makeGraphic('JukeBoxTag', 300+IntroTagWidth, 100, IntroTagColor)
		setObjectCamera('JukeBoxTag', 'other')
		addLuaSprite('JukeBoxTag', true)
	
		--the box
		makeLuaSprite('JukeBox', 'empty', -305-IntroTagWidth, 15)
		makeGraphic('JukeBox', 300, 100, '000000')
		setObjectCamera('JukeBox', 'other')
		addLuaSprite('JukeBox', true)
		
		--the text for the "Now Playing" bit
		makeLuaText('JukeBoxText', 'Now Playing:', 300, -305-IntroTagWidth, 30)
		setTextAlignment('JukeBoxText', 'left')
		setObjectCamera('JukeBoxText', 'other')
		setTextSize('JukeBoxText', IntroTextSize)
		addLuaText('JukeBoxText')
		
		--text for the song name
		makeLuaText('JukeBoxSubText', songName, 300, -305-IntroTagWidth, 60)
		setTextAlignment('JukeBoxSubText', 'left')
		setObjectCamera('JukeBoxSubText', 'other')
		setTextSize('JukeBoxSubText', IntroSubTextSize)
		addLuaText('JukeBoxSubText')
	
		--text for the artist name
		makeLuaText('JukeBoxSubText2', 'by SixteenJ', 300, -305-IntroTagWidth, 90)
		setTextAlignment('JukeBoxSubText2', 'left')
		setObjectCamera('JukeBoxSubText2', 'other')
		setTextSize('JukeBoxSubText2', IntroSubText2Size)
		addLuaText('JukeBoxSubText2')
	end
	
	--motion functions
	function onSongStart()
		-- Inst and Vocals start playing, songPosition = 0
		doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
		doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
		doTweenX('MoveInThree', 'JukeBoxText', 0, 1, 'CircInOut')
		doTweenX('MoveInFour', 'JukeBoxSubText', 0, 1, 'CircInOut')
		doTweenX('MoveInFive', 'JukeBoxSubText2', 0, 1, 'CircInOut')
		
		runTimer('JukeBoxWait', 3, 1)
	end
	
	function onTimerCompleted(tag, loops, loopsLeft)
		-- A loop from a timer you called has been completed, value "tag" is it's tag
		-- loops = how many loops it will have done when it ends completely
		-- loopsLeft = how many are remaining
		if tag == 'JukeBoxWait' then
			doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.5, 'CircInOut')
			doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
			doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
			doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
			doTweenX('MoveOutFive', 'JukeBoxSubText2', -450, 1.5, 'CircInOut')
		end
	end

