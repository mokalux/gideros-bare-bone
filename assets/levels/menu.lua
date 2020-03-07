Menu = Core.class(Sprite)

function Menu:init()
	-- BG
	application:setBackgroundColor(0xff34AA)
	-- UI
	local button = ButtonText.new(
		{
			text="01", textscalex=4, textcolorup=0x0, textcolordown=0xffff00,
			imgdown="gfx/ui/Blue.png", nohover=true,
		}
	)
	button:setPosition(myappwidth / 2, 4 * myappheight / 10)
	button:addEventListener("click", function()
		scenemanager:changeScene("level1", 1, SceneManager.moveFromRight, easing.outBack)
	end)
	self:addChild(button)
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
	self:addEventListener(Event.KEY_UP, function(e)
		if e.keyCode == KeyCode.BACK or e.keyCode == KeyCode.ESC then
			application:exit()
		end
	end)
end
