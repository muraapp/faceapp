server '13.112.118.70', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/muraapp/.ssh/id_rsa'
