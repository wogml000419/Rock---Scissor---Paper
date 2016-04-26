-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--주먹 = 1,  가위 = 2,  보자기 = 3

--가위, 바위, 보를 표시하는 함수들

function scissorFunc( event )
	if event.phase == "ended" then
		display.remove(b_image)
		b_image = display.newImage("/image/가위.jpg", display.contentCenterX, display.contentHeight * (2/3))
		func(2)
	end
end
function rockFunc( event )
	if event.phase == "ended" then
		display.remove(b_image)
		b_image = display.newImage("/image/바위.jpg", display.contentCenterX, display.contentHeight * (2/3))
	  func(1)
	end
end
function paperFunc( event )
	if event.phase == "ended" then
		display.remove(b_image)
		b_image = display.newImage("/image/보.jpg", display.contentCenterX, display.contentHeight * (2/3))
		func(3)
	end
end
-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------

--AI의 손 표시와 승패 판정
function func( p )
	math.randomseed(os.time())
	AI = math.random(1, 3)
	display.remove(a_image)
	if AI==1 then
		a_image = display.newImage("/image/바위.jpg", display.contentCenterX, display.contentHeight * (1/3))
	elseif AI==2 then
		a_image = display.newImage("/image/가위.jpg", display.contentCenterX, display.contentHeight * (1/3))
	elseif AI==3 then
		a_image = display.newImage("/image/보.jpg", display.contentCenterX, display.contentHeight * (1/3))
	end
	print (AI, p)
	display.remove(a_text)
	if AI == p then
		print ("무승부!")
		a_text = display.newText("DRAW!", display.contentCenterX, display.contentCenterY, native)
	elseif AI==1 and p==2 then
		print ("패배!")
		a_text = display.newText("LOSE", display.contentCenterX, display.contentCenterY, native)
	elseif AI==2 and p==3 then
		print ("패배!")
		a_text = display.newText("LOSE", display.contentCenterX, display.contentCenterY, native)
	elseif AI==3 and p==1 then
		print ("패배!")
		a_text = display.newText("LOSE", display.contentCenterX, display.contentCenterY, native)
	else
		print ("승리!")
		a_text = display.newText("WIN!", display.contentCenterX, display.contentCenterY, native)
	end
end
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
scissor = display.newImage("/image/가위.jpg", display.contentWidth * (1/6), display.contentHeight)
rock = display.newImage("/image/바위.jpg", display.contentCenterX, display.contentHeight)
paper = display.newImage("/image/보.jpg", display.contentWidth * (5/6), display.contentHeight)

scissor:addEventListener("touch", scissorFunc)
rock:addEventListener("touch", rockFunc)
paper:addEventListener("touch", paperFunc)
--------------------------------------------------------------------------------------
