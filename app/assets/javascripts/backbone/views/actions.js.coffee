class Wall.Views.ActionsView extends Backbone.View
  el: "#actions"

  events:
    "click a.otrafrase" : "otraFrase"
    "click a.agregar"   : "agregar"

  otraFrase: (e) =>
    e.stopPropagation()
    e.preventDefault()

    wallApp.frase.forceRefreshOnNextFrame = true
    wallApp.wallappRouter.navigate("#", true)
    #wallApp.frase.refreshIntervalPerCharacter *= .75

  agregar: (e) =>
    e.stopPropagation()
    e.preventDefault()
    wallApp.wallappRouter.navigate("#frases/new", true)