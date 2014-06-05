@Kozak.module 'Header', (Header, App, Backbone, Marionette, $, _) ->

  Header.addInitializer ->

  class HeaderRouter extends Backbone.Marionette.AppRouter
    appRoutes:
      'some/route': 'someMethod'

    controller: new Header.Controller()

  router = new HeaderRouter()