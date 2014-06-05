@Kozak.module "Entities.Project", (Project, App, Backbone, Marionette, $, _) ->
  class Project.Item extends Backbone.Model
    defaults:
      data: "Some data"

  class Project.Collection extends Backbone.Collection
    model: Project.Item

