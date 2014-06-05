@Kozak.module 'Header', (Header, App, Backbone, Marionette, $, _) ->

  class Header.Controller extends Marionette.Controller

    someMethod: ->
      console.log 'controller method'