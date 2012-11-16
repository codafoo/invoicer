Joosy.namespace 'Customers', ->

  class @EditPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'edit'

    elements:
      'rawForm': 'form'

    @fetch (complete) ->
      Customer.find @params.id, (customer) =>
        @data.customer = customer
        complete()

    @afterLoad ->
      @form = Joosy.Form.attach @rawForm,
        resource: @data.customer
        success: (data) => @navigate '/customers'