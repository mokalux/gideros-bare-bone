Level1 = Core.class(Sprite)

function Level1:init()
	-- THEME
	local colortheme = g_colortheme02
	-- BG
	application:setBackgroundColor(colortheme[3])
	local mybgbmp = Bitmap.new(Texture.new("gfx/menu/menu_bg.png"))
	mybgbmp:setAnchorPoint(0.5, 0.5)
	mybgbmp:setScale(0.8)
	mybgbmp:setPosition(myappwidth / 2, myappheight / 2)
	self:addChild(mybgbmp)
	-- BUTTON THEME
	local mypixelcolorup = colortheme[4]
	local mypixelcolordown = colortheme[5]
	local mytextcolorup = colortheme[5]
	local mytextcolordown = colortheme[6]
	local mytextcolordisabled = colortheme[7]
	-- BUTTON 1
	local mybtn01 = ButtonTextPUDDT.new({
		pixelcolorup=mypixelcolorup,
		text="X", font=g_font1, fontsize=32, textcolorup=mytextcolorup, textcolordown=mytextcolordown,
	})
	mybtn01:setPosition(myappwidth - mybtn01:getWidth() / 2, mybtn01:getHeight() / 2)
	self:addChild(mybtn01)
	mybtn01:addEventListener("clicked", function() self:goMenu() end)
	-- LISTENERS
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

-- GAME LOOP
function Level1:onEnterFrame(e)
end

-- EVENT LISTENERS
function Level1:onTransitionInBegin()
end

function Level1:onTransitionInEnd()
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	self:myKeysPressed()
end

function Level1:onTransitionOutBegin()
	self:removeEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function Level1:onTransitionOutEnd()
end

-- KEYS HANDLER
function Level1:myKeysPressed()
	self:addEventListener(Event.KEY_UP, function(e)
		if e.keyCode == KeyCode.BACK or e.keyCode == KeyCode.ESC then self:goMenu() end
	end)
end

function Level1:goMenu()
	scenemanager:changeScene("menu", 1)
end
