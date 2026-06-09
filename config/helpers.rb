def json?
  request.env['HTTP_ACCEPT'] == 'application/json'
end
