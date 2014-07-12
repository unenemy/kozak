@Kozak.module 'Header', (Header, App, Backbone, Marionette, $, _) ->

  class Header.View extends Marionette.ItemView
    template: JST['backbone/apps/header/_templates/header']
    serializeData: ->
      viewData = {}
      viewData.projects = this.options.projects
      viewData