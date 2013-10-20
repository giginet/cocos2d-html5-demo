$ ->
  d = document

  appFiles = ->
    _.map([
      # Write Pathes here
        'game'
        'scene/title_scene'
      ], (path) ->
        "src/javascript/#{path}.js"
    )

  c =
    COCOS2D_DEBUG : 2
    box2d : false
    chipmunk : false
    showFPS : true
    frameRate : 60
    loadExtension : true
    renderMode : 1
    tag : 'gameCanvas'
    engineDir : 'bower_components/cocos2d/cocos2d/'
    appFiles : appFiles()

  if not d.createElement('canvas').getContext
    s = d.createElement('div')
    s.innerHTML = """
      <h2>Your browser does not support HTML5 canvas!</h2>
      <p>Google Chrome is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier.Click the logo to download.</p>
      <a href="http://www.google.com/chrome" target="_blank"><img src="http://www.google.com/intl/zh-CN/chrome/assets/common/images/chrome_logo_2x.png" border="0"/></a>
    """
    p = d.getElementById(c.tag).parentNode
    p.style.background = 'none'
    p.style.border = 'none'
    p.insertBefore(s)

    d.body.style.background = '#ffffff'

  window.addEventListener('DOMContentLoaded', ->
    # first load engine file if specified
    s = d.createElement('script')

    if c.SingleEngineFile and !c.engineDir
      s.src = c.SingleEngineFile
    else if c.engineDir and not c.SingleEngineFile
      s.src = c.engineDir + 'platform/jsloader.js'
    else
      alert('You must specify either the single engine file OR the engine directory in "cocos2d.js"')

    # s.src = 'Packed_Release_File.js'; //IMPORTANT: Un-comment this line if you have packed all files into one

    document.ccConfig = c
    s.id = 'cocos2d-html5'
    d.body.appendChild(s)
  )