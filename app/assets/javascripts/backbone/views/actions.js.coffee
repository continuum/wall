class Wall.Views.ActionsView extends Backbone.View
  el: "#actions"

  events:
    "click a.otrafrase": "otraFrase"

  otraFrase: (e) =>
    e.stopPropagation()
    e.preventDefault()
    wallApp.frase.forceRefreshOnNextFrame = true
    #wallApp.frase.refreshIntervalPerCharacter *= .75