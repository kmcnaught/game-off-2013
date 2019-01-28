Q = Game.Q

Q.scene "level1", (stage) ->

  # main map with collision
  Game.map = map = new Q.TileLayer
    type: Game.SPRITE_TILES
    layerIndex: 0
    dataAsset: Game.assets.level1.dataAsset
    sheet: Game.assets.map.sheetName
    tileW: Game.assets.map.tileSize
    tileH: Game.assets.map.tileSize
    z: 2

  stage.collisionLayer map

  # decorations
  background = new Q.TileLayer
    layerIndex: 1,
    type: Game.SPRITE_NONE
    dataAsset: Game.assets.level1.dataAsset
    sheet: Game.assets.map.sheetName
    tileW: Game.assets.map.tileSize
    tileH: Game.assets.map.tileSize
    z: 1

  stage.insert background

  # player
  Game.player = player = stage.insert new Q.Player(Q.tilePos(3.5, 9))

  # camera
  stage.add("viewport")
  Game.setCameraTo(stage, player)

  # enemies
  enemies = [
    ["Zombie", Q.tilePos(14, 9)]
  ]

  stage.loadAssets(enemies)

  # items
  items = [
    ["Key", Q.tilePos(14.5, 9)]
    ["Door", Q.tilePos(27, 9)]
    ["Gun", Q.tilePos(14.5, 3, {bullets: 3})]
    ["Heart", Q.tilePos(14.5, 15)]
  ]

  stage.loadAssets(items)

  # button
  button = stage.insert new Q.UI.Button
    x: Q.width/2
    y: Q.height-10
    w: 150
    h: 150
    fill: "#c4da4a"
    radius: 10
    fontColor: "#353b47"
    font: "400 58px Jolly Lodger"
    label: "jump"
    keyActionName: "confirm"
    type: Q.SPRITE_UI | Q.SPRITE_DEFAULT
  
  button.on "click", (e) ->
    Q.inputs['up']=1

  button.on "release", (e) ->
    Q.inputs['up']=0

  # store level data for level summary
  Game.currentLevelData.health.available = stage.lists.Heart.length
  Game.currentLevelData.zombies.available = stage.lists.Zombie.length

