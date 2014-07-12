@Kozak.module 'Board', (Board, App, Backbone, Marionette, $, _) ->

  Board.addInitializer ->
    view = new Board.View()
    App.mainRegion.show(view)
