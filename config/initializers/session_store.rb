# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_buybooks_session',
  :secret      => 'f42252db4c345df02bb3403ec153d44aedf8a63b5baf0ddc8aff919941ff6fab0b9414bd53eed0ddf5d2de8ad499e5d9f09db6b24ce8de8a311626b37e0decac'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
