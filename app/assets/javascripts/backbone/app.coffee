@Kozak = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.addRegions
    headerRegion: '#header-region'
    mainRegion: '#main-region'

  App.addInitializer ->
    console.log 'App started'

  App.on 'initialize:after', (options) ->
    if Backbone.history
      Backbone.history.start()

  App

$ =>
  @Kozak.start()
