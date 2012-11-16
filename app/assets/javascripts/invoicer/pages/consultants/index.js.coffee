Joosy.namespace 'Consultants', ->

  class @IndexPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'index'
    @fetch (complete) ->
      Consultant.find 'all', (consultants) =>
        @data.consultants = consultants
        complete()