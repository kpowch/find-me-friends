require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777
  config.storage = :fog
  config.fog_provider = 'fog/google'                        # required
  config.fog_credentials = {
    provider:                         'Google',
    google_storage_access_key_id:      "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDImymV7S05A7R2\nWAU+tVyI2sJ3Uh6N6d3W7dqHI/+sOr34MqQz0EabouuigFFR+i6GPWI9+bfMC1mX\nzS08VnYTqRftboVOuktnUH36SkuwViWrWrwjZHkaBdkTrZAR/N1b+L9xJfgnp6Cy\npB6bXTKS7A/8zaF8OD5Q3fsr/WdyjRhn4M3Ig6UzajQrU65n+VifkKnKJpjD5yTH\n7zBWrO8Iom6Io+AmeW/BeG1IZONfVc2weP8n6dwHLR6mKC6jnkrLOkIkEFCegEsK\nnz5Uwbau+4SaI7Il4qFrKGvc/isHg1/0kR5Q6uJPBCMaenGEWAPXRNMSIze9BmqG\nLhW36gR1AgMBAAECggEBAJvYf0wsgC+FA1PVOe3ns8XWPbG5KGeTwnZRPq4yd1R0\nJlWF8i8WpWQQBAOwsHyBYleDpKkFMZbhUm8uRPBVM1I+0YnxjLsG28GdtOEXiwmp\nQ4aF7ReJ3NMsq+Ivunde/RGQhBoBJ3KXNa7S9bw5gSrHHfyGO+hnQXJNoe4g5ZcF\nSi79S1H079H0UG1MMvMVReGuV9yEdGJ6UBbhjKUqzbtd1OruB7Q48E+WzR/XUKzw\nE6JZ5aMXMgpsdcZrJDUz0UdzN8wOpsa3JLYtcXKNURhCCEon+tsm5fji+ZeNtZcB\n5HBjhc+R5Hyh09cDk5k9OGX28ZZWFweNSjsTM7PyUYECgYEA6KmraxzQOHcoBrKP\n6MYQIdTo2tkLbB0QkVnMgyphSCDs3qtKgt54xSPJyhwdCXKwAjsC1BWqcrQVKCKv\nKhK70kHTZ3oDkl13HzZD00HDXwdn6/fhpd9N1gCZkTUHiS+tsyoIqD7eBepXEft7\n+bGjvOwYBSoy4uXrEpNMWYeuAIUCgYEA3LpW69SjZXXVnouYx9af1EvyU7BkoVa/\nUCiRlAySMQaanrvgm050l2LJonc/SnY2WXCWMnzefpCs0s9KqnDYdmiTb9x9Qew2\nYGgXcL7zQyRjWqBi3cAKefE0lmb2vLCB8KOD6jGWf90glv6i3QERsM3f6DJLtwz3\nUDlJs7SNrzECgYAoM4kHDQd9ejlUTu5GzlJjRiKmDfLHT45ZTybjUyNUDzxejUJm\nsoIzridj4M+znjmDaSbn9oZpI2y0bqnNn0cM4YrhyldrpvK6VeoKSsazWNhAEajP\nvHH6lEf0qzEOJ0rgNlcgmxxJ8V/yH34geu1L64+K9OuuAQRJRWJf5e3O8QKBgQCz\nlaQswdejMAj6sqc+SB/H8XaaopRtNA/5ntg69TNoUfAxH7jxgxaXKNfWqGDFK4Ky\nqEh7kV7Q6NLDvcYJAEENra3vQBxlK1NegrI3mBSB1zRCwuVNd/bOGfJoQCOVh6Jg\n8BjezTOemoHueAR3/WuwRwBagblamGELU2Dkpgz0sQKBgAX3bXd+lCk5S72QrW2n\nELZUHjKyS9K9xlaNSOLx4rQfIfmaSjUDhDT4lJZ21kTMplyl0WkbBUmn1Cie3qon\nZryYqglpK6D0czx6OThTTsi0uyTgS44+YggVHABvXG0r+oLjs0I5bdJRkg1vS5zb\nJ2WnH37NXPlSB715iBzsTALW\n-----END PRIVATE KEY-----\n"

    google_storage_secret_access_key: "7956e50c49943a2dbe7c62db608507c0fb135129"
  }
  config.fog_directory = '~/.fog'
end