# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# Recycle::Application.config.secret_token = "b691020baca108d71396237f4945d14dbc8f76d33e9b5c6878f59227674e975de1767c124fc521501c40b57c6b6fd1d558f6256c58666cd4c1ba4ba4b790d696"
Recycle::Application.config.secret_token = ENV['SECRET_TOKEN']
