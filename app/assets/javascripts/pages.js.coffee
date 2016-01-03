jQuery ->
  $('.auth-token-form').on 'propertychange change click keyup input paste', '.auth-token-input', (event) ->
    auth_token = $(this).val()
    submit_link = $(this).siblings('a')
    href  = submit_link.data('href')
    submit_link.attr('href', href + auth_token)
