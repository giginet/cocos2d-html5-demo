var Game,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Game = (function(_super) {
  __extends(Game, _super);

  function Game(scene) {
    Game.__super__.constructor.call(this);
    this.startScene = scene;
    cc.COCOS2D_DEBUG = document.ccConfig['COCOS2D_DEBUG'];
    cc.initDebugSetting();
    cc.setup(document.ccConfig['tag']);
    cc.AppController.shareAppController().didFinishLaunchingWithOptions();
  }

  Game.prototype.applicationDidFinishLaunching = function() {
    var director,
      _this = this;
    if (cc.RenderDoesnotSupport()) {
      alert("Browser doesn't support Canvas or WebGL");
    }
    director = cc.Director.getInstance();
    cc.EGLView.getInstance().setDesignResolutionSize(320, 480, cc.RESOLUTION_POLICY.SHOW_ALL);
    director.setDisplayStats(document.ccConfig['showFPS']);
    director.setAnimationInterval(1.0 / document.ccConfig['frameRate']);
    return cc.LoaderScene.preload([], function() {
      return director.replaceScene(new _this.startScene);
    });
  };

  return Game;

})(cc.Application);
