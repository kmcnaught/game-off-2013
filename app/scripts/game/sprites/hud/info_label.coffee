Q = Game.Q

Q.UI.InfoLabel = Q.UI.Text.extend "UI.InfoLabel",
  init: (p, defaultProps) ->
    @_super p,
      x: 0
      y: 0
      label: ""
      color: "#222221"
      size: 24
      family: "Boogaloo"

  changeLabel: (new_label) ->
    @afterLabelChange "..."
    self = this;
    setTimeout ( -> self.afterLabelChange new_label), 250

  afterLabelChange: (new_label) ->
    if new_label
      @p.label = new_label 
    @calcSize()
    @p.container.p.x = @p.offsetLeft + @p.w/2 + 10
    @p.container.fit(5, 10)
    Q._generatePoints(@)

  tutorial: ->
    @changeLabel "If you can complete this tutorial you're ready to save the zombies"

  intro: ->
    @changeLabel "I need to find the way out of here"

  keyNeeded: ->
    @changeLabel "I need the key"

  doorOpen: ->
    @changeLabel "Nice! Now I need to enter the door"

  gunFound: ->
    @changeLabel "I found the gun, I can shoot pressing Spacebar"

  outOfBullets: ->
    @changeLabel "I'm out of ammo"

  keyFound: ->
    @changeLabel "I found the key, now I need to find the the door"

  clear: ->
    @afterLabelChange ""

  lifeLevelLow: ->
    @changeLabel "I need to be more careful"

  extraLifeFound: ->
    @changeLabel "I feel better now!"

  lifeLost: ->
    @changeLabel "That hurts!"

  zombieModeOn: ->
    @changeLabel "I was bitten too many times. "

  zombieModeOnNext: ->
    @changeLabel "I've turned into a zombie. Nooo!"

  zombieModeOff: ->
    @changeLabel "Ok, back to business"


