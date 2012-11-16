Joosy.Router.map
  404                     : (path) -> alert "Page '#{path}' was not found :("
  '/'                     : Welcome.IndexPage
  '/consultants'    :
    '/'               : Consultants.IndexPage
    '/new'            : Consultants.NewPage
    '/:id'            : Consultants.ShowPage
    '/:id/edit'       : Consultants.EditPage
  '/customers'      :
    '/'               : Customers.IndexPage
    '/new'            : Customers.NewPage
    '/:id'            : Customers.ShowPage
    '/:id/edit'       : Customers.EditPage