Joosy.namespace 'Customers', ->

  class @IndexPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'index'
    @fetch (complete) ->
      Customer.find 'all', (customers) =>
        @data.customers = customers
        complete()