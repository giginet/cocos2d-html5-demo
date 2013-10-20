class TitleScene extends cc.Scene
  onEnter : ->
    super()
    @kawaztan = new cc.Sprite.create("resources/image/kawaztan.png")
    @addChild @kawaztan
    @kawaztan.setPosition cc.p(200, 120)
    rotateBy = cc.RepeatForever.create(cc.RotateBy.create(2, 180))
    @kawaztan.runAction(rotateBy)
