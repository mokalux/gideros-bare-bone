Level1 = Core.class(Sprite)

function Level1:init()
	-- BG
	application:setBackgroundColor(0x0034AA)
	-- UI
	local button = ButtonText.new(
		{text="Menu", textscalex=4, textcolorup=0xffff00, textcolordown=0x00ff00}
	)
	button:setPosition(myappwidth / 2, 8 * myappheight / 10)
	button:addEventListener("click", function() self:goToMenu() end)
	self:addChild(button)
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
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function Level1:onTransitionInEnd()
	self:myKeysPressed()
end

function Level1:onTransitionOutBegin()
	self:removeEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function Level1:onTransitionOutEnd()
end

-- KEYS HANDLER
function Level1:myKeysPressed()
	self:addEventListener(Event.KEY_DOWN, function(e)
		if e.keyCode == KeyCode.BACK or e.keyCode == KeyCode.ESC then self:goToMenu() end
	end)
end

-- FUNCTIONS
function Level1:goToMenu()
	scenemanager:changeScene("menu", 1, SceneManager.moveFromLeft, easing.outBack)
end
