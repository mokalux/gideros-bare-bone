Menu = Core.class(Sprite)

function Menu:init()
	-- THEME
	local colortheme = g_colorthememenu
	-- BG
	application:setBackgroundColor(colortheme[3])
	local mybgbmp = Bitmap.new(Texture.new("gfx/menu/menu_bg.png"))
	mybgbmp:setAnchorPoint(0.5, 0.5)
	mybgbmp:setScale(0.8)
	mybgbmp:setPosition(myappwidth / 2, myappheight / 2)
	self:addChild(mybgbmp)
	-- TITLE
	local myfont = TTFont.new(g_font1, 44, "")
	local myfonto = TTFont.new(g_font1, 44, "", true, 1)
	local cf = CompositeFont.new{
		{font=myfonto, color=0x0, x=2, y=3},
		{font=myfont},
	}
	local mytitle = TextField.new(cf, "MY GAME\n   TITLE")
	mytitle:setAnchorPoint(0.5, 0.5)
	mytitle:setPosition(myappwidth / 2, 2.75 * myappheight / 10)
	mytitle:setTextColor(colortheme[4])
	mytitle:setRotation(-5)
	self:addChild(mytitle)
	-- BUTTON THEME
	local mypixelcolorup = colortheme[4]
	local mypixelcolordown = colortheme[5]
	local mytextcolorup = colortheme[5]
	local mytextcolordown = colortheme[6]
	local mytextcolordisabled = colortheme[7]
	-- BUTTON 1
	local mybtn01 = ButtonTextPUDDT.new({
		pixelcolorup=mypixelcolorup,
		text="BUTTON 1", font=g_font1, fontsize=32, textcolorup=mytextcolorup, textcolordown=mytextcolordown,
	})
	mybtn01:setPosition(myappwidth / 2, 5 * myappheight / 10)
	self:addChild(mybtn01)
	mybtn01:addEventListener("clicked", function() self:goLevel1() end)
	-- BUTTON 2
	local mybtn02 = ButtonTextPUDDT.new({
		pixelcolorup=mypixelcolorup,
		text="BUTTON 2", font=g_font1, fontsize=32, textcolorup=mytextcolorup, textcolordown=mytextcolordown,
	})
	mybtn02:setPosition(myappwidth / 2, 6.25 * myappheight / 10)
	self:addChild(mybtn02)
	mybtn02:addEventListener("clicked", function() self:goLevel1() end)
	-- BUTTON QUIT
	local mybtnquit = ButtonTextPUDDT.new({
		imgup="gfx/ui/btn_01_up.png", imgdown="gfx/ui/btn_01_down.png",imgdisabled="gfx/ui/btn_01_disabled.png",
		text="QUIT", font=g_font1, fontsize=32, textcolorup=mytextcolorup, textcolordown=mytextcolordown,
		tooltip="QUIT?",
	})
	mybtnquit:setPosition(myappwidth / 2, myappheight - mybtnquit:getHeight() / 2 - 8)
	self:addChild(mybtnquit)
	mybtnquit:addEventListener("clicked", function() self:goExit() end)
	mybtnquit:setDisabled(true)
	-- LISTENERS
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

-- GAME LOOP
function Menu:onEnterFrame(e)
end

-- EVENT LISTENERS
function Menu:onTransitionInBegin()
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function Menu:onTransitionInEnd()
	self:myKeysPressed()
end

function Menu:onTransitionOutBegin()
	self:removeEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function Menu:onTransitionOutEnd()
end

-- KEYS HANDLER
function Menu:myKeysPressed()
	self:addEventListener(Event.KEY_DOWN, function(e)
	end)
	self:addEventListener(Event.KEY_UP, function(e)
		if e.keyCode == KeyCode.BACK or e.keyCode == KeyCode.ESC then self:goExit() end
	end)
end

function Menu:goLevel1()
	-- scenemanager:changeScene("level1", 1, SceneManager.moveFromRight, easing.outBack)
	scenemanager:changeScene("level1", 1)
end

function Menu:goExit()
	application:exit()
end
