Joosy.namespace 'Consultants', ->

  class @EditPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'edit'

    elements:
      'rawForm': 'form'

    @fetch (complete) ->
      Consultant.find @params.id, (consultant) =>
        @data.consultant = consultant
        complete()

    @afterLoad ->
      @form = Joosy.Form.attach @rawForm,
        resource: @data.consultant
        success: (data) => @navigate '/consultants'