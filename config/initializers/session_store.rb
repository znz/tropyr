# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_myapp_session',
  :secret      => '3a61e4ab5b03075c3dc7ea8f1cfe11c8d11986e767eea28988f5e1dc1c278b4e3f2c9271280fa67db26bd5124b14c9276b59158649787d25e4f60c98458782ea'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
