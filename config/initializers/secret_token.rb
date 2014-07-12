# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'
def secure_token
token_file = Rails.root.join('.secret')
if File.exist?(token_file)
# Use the existing token.
File.read(token_file).chomp
else
# Generate a new token and store it in token_file.
token = SecureRandom.hex(64)
File.write(token_file, token)
token
end
end
ProjectTracker::Application.config.secret_key_base = '6e2178d778baf58ae15d89b398cf1e229f9ed33a8afc11c0a13b9c863a329bbe01969635d73edfaf06a829f3a66e6fa77fac3990b8837a2f057d0dd0f4f57bc6'
