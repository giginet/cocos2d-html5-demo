var TitleScene, _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

TitleScene = (function(_super) {
  __extends(TitleScene, _super);

  function TitleScene() {
    _ref = TitleScene.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  TitleScene.prototype.onEnter = function() {
    var rotateBy;
    TitleScene.__super__.onEnter.call(this);
    this.kawaztan = new cc.Sprite.create("resources/image/kawaztan.png");
    this.addChild(this.kawaztan);
    this.kawaztan.setPosition(cc.p(200, 120));
    rotateBy = cc.RepeatForever.create(cc.RotateBy.create(2, 180));
    return this.kawaztan.runAction(rotateBy);
  };

  return TitleScene;

})(cc.Scene);
