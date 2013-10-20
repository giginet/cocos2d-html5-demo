class Game extends cc.Application
  constructor : (scene) ->
    super()
    @startScene = scene
    cc.COCOS2D_DEBUG = document.ccConfig['COCOS2D_DEBUG']
    cc.initDebugSetting()
    cc.setup(document.ccConfig['tag'])
    cc.AppController.shareAppController().didFinishLaunchingWithOptions()

  applicationDidFinishLaunching : () ->
    if cc.RenderDoesnotSupport()
      alert("Browser doesn't support Canvas or WebGL");

    director = cc.Director.getInstance()
    cc.EGLView.getInstance().setDesignResolutionSize(320, 480, cc.RESOLUTION_POLICY.SHOW_ALL)

    director.setDisplayStats(document.ccConfig['showFPS'])

    director.setAnimationInterval(1.0 / document.ccConfig['frameRate'])

    cc.LoaderScene.preload([], =>
      director.replaceScene(new @startScene)
    )
