-- plugins
require "scenemanager"
require "easing"
-- globals
myappwidth, myappheight = application:getContentWidth(), application:getContentHeight()
-- fonts
g_font1 = "fonts/KenPixel Blocks.ttf"
g_font2 = "fonts/KenPixel Blocks.ttf"
-- color themes
g_colorthememenu = {0x0, 0xffffff, 0xF27294, 0x1A1A26, 0x32738C, 0xF2C288, 0xF27052} -- Beautiful space background
g_colortheme01 = {0x0, 0xffffff, 0xFFB6A8, 0xE89A99, 0xFFB5D8, 0xE899E5, 0xE9A8FF}
g_colortheme02 = {0x0, 0xffffff, 0x114CA8, 0x2F4A75, 0x00C9DB, 0xE06538, 0xA82411} -- 0,201,219 composite
-- scene manager
scenemanager = SceneManager.new({
	["menu"] = Menu,
	["level1"] = Level1,
})
stage:addChild(scenemanager)
scenemanager:changeScene("menu")

--[[
-- TRANSITIONS
transitions = {
	SceneManager.moveFromRight, -- 1
	SceneManager.moveFromLeft, -- 2
	SceneManager.moveFromBottom, -- 3
	SceneManager.moveFromTop, -- 4
	SceneManager.moveFromRightWithFade, -- 5
	SceneManager.moveFromLeftWithFade, -- 6
	SceneManager.moveFromBottomWithFade, -- 7
	SceneManager.moveFromTopWithFade, -- 8
	SceneManager.overFromRight, -- 9
	SceneManager.overFromLeft, -- 10
	SceneManager.overFromBottom, -- 11
	SceneManager.overFromTop, -- 12
	SceneManager.overFromRightWithFade, -- 13
	SceneManager.overFromLeftWithFade, -- 14
	SceneManager.overFromBottomWithFade, -- 15
	SceneManager.overFromTopWithFade, -- 16
	SceneManager.fade, -- 17
	SceneManager.crossFade, -- 18
	SceneManager.flip, -- 19
	SceneManager.flipWithFade, -- 20
	SceneManager.flipWithShade, -- 21
}
]]

--[[
-- EASINGS
easings = {
	easing.inBack, -- 1
	easing.outBack, -- 2
	easing.inOutBack, -- 3
	easing.inBounce, -- 4
	easing.outBounce, -- 5
	easing.inOutBounce, -- 6
	easing.inCircular, -- 7
	easing.outCircular, -- 8
	easing.inOutCircular, -- 9
	easing.inCubic, -- 10
	easing.outCubic, -- 11
	easing.inOutCubic, -- 12
	easing.inElastic, -- 13
	easing.outElastic, -- 14
	easing.inOutElastic, -- 15
	easing.inExponential, -- 16
	easing.outExponential, -- 17
	easing.inOutExponential, -- 18
	easing.linear, -- 19
	easing.inQuadratic, -- 20
	easing.outQuadratic, -- 21
	easing.inOutQuadratic, -- 22
	easing.inQuartic, -- 23
	easing.outQuartic, -- 24
	easing.inOutQuartic, -- 25
	easing.inQuintic, -- 26
	easing.outQuintic, -- 27
	easing.inOutQuintic, -- 28
	easing.inSine, -- 29
	easing.outSine, -- 30
	easing.inOutSine, -- 31
}
]]
