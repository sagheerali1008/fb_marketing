# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( reports.css user_layout.js user_layout.css admin_layout.css admin_layout.js jquery.validate.js campaign_popup.js rule_forms.js admin/moment.min.js admin/daterangepicker.min.js)
#Rails.application.config.assets.precompile += %w(jquery.validate.js rule_forms.js)
