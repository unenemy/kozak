@Kozak.module 'Header', (Header, App, Backbone, Marionette, $, _) ->

  Header.addInitializer ->
    view = new Header.View({projects: ['Project 1', 'Project 2', 'Project 3']})
    App.headerRegion.show(view)

  class HeaderRouter extends Backbone.Marionette.AppRouter
    appRoutes:
      'some/route': 'someMethod'

    controller: new Header.Controller()

  router = new HeaderRouter()