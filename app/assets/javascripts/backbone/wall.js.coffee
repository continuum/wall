#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Wall =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

class Wall.App extends Backbone.Marionette.Application

  initModels: =>
    @frases = new Wall.Collections.Frases()
    @frase.collection = @frases
    @frases.fetch()

  initViews: =>
    @actions = new Wall.Views.ActionsView()

  frasesIndex: =>
    @hiddenSections.close()
    @frase.startPresentation()

  showAddingBox: =>
    @frase.close()
    @addingBox = new Wall.Views.AddingBox(collection: @frases)
    @hiddenSections.show @addingBox
    return true

window.wallApp = wallApp = new Wall.App()

wallApp.addInitializer (options) ->
  wallApp.addRegions
    frase: Wall.Views.FrasesSliderRegion
    hiddenSections: "#hidden-sections"

  wallApp.initModels()
  wallApp.initViews()

wallApp.addInitializer (options) ->
  @wallappRouter = new Wall.Routers.WallAppRouter
    controller: wallApp

  Backbone.history.start()


$(document).on "ready", ->
  wallApp.start()
  $(".someClass").tipTip()