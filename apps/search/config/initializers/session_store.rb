# Be sure to restart your server when you modify this file.

require 'action_dispatch/middleware/session/dalli_store'
Rails.application.config.session_store :dalli_store, :memcache_server => ['we-rails2-cache.gqmntp.0001.use1.cache.amazonaws.com:11211'], :namespace => 'dev_sessions', :key => '_foundation_session', :expire_after => 7.days

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Catalogue::Application.config.session_store :active_record_store
