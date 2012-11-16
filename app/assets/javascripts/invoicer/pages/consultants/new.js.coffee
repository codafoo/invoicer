Joosy.namespace 'Consultants', ->

  class @NewPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'new'
    elements:
      'rawForm': 'form'

    @fetch (complete) ->
      @data.consultant = Consultant.build()
      complete()

    @afterLoad ->
      @form = Joosy.Form.attach @rawForm,
        resource: @data.consultant
        success: (data) => @navigate '/consultant'