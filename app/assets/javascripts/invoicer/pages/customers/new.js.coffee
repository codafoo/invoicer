Joosy.namespace 'Customers', ->

  class @NewPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'new'
    elements:
      'rawForm': 'form'

    @fetch (complete) ->
      @data.customer = Customer.build()
      complete()

    @afterLoad ->
      @form = Joosy.Form.attach @rawForm,
        resource: @data.customer
        success: (data) => @navigate '/customers'
