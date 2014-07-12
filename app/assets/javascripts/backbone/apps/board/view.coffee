@Kozak.module 'Board', (Board, App, Backbone, Marionette, $, _) ->

  class Board.View extends Marionette.ItemView
    template: JST['backbone/apps/board/_templates/board']
