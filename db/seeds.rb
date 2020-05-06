# Admin creation
admin_user = User.find_or_initialize_by(email: "admin@brainio.com", name: "Admin")
admin_user.password = 123456
admin_user.save
puts "admin user added!"
puts "email: #{admin_user.email}"
admin_user.add_role :admin  unless admin_user.has_role? :admin

# Categories creation
enagagment = Category.find_or_initialize_by(name: "Re-engagement")
enagagment.save

lookalike = Category.find_or_initialize_by(name: "Prospecting Lookalike")
lookalike.save

retargeting = Category.find_or_initialize_by(name: "Retargeting")
retargeting.save

retention = Category.find_or_initialize_by(name: "Retention")
retention.save
puts "Categories added!"

# Enagagment sub-categories creation
ad_engagers = enagagment.sub_categories.find_or_initialize_by(name: "Ads Engagors")
ad_engagers.save

video_viewers = enagagment.sub_categories.find_or_initialize_by(name: "Video Viewers")
video_viewers.save

social_audiences = enagagment.sub_categories.find_or_initialize_by(name: "Social Media Engagors")
social_audiences.save
puts "Enagagment sub-categories added!"

# Lookalike sub-categories creation
category_affinity = lookalike.sub_categories.find_or_initialize_by(name: "Category Affinity")
category_affinity.save

product_affinity = lookalike.sub_categories.find_or_initialize_by(name: "Product Affinity")
product_affinity.save

special_audiences = lookalike.sub_categories.find_or_initialize_by(name: "Special Audiences")
special_audiences.save

social_media_fans = lookalike.sub_categories.find_or_initialize_by(name: "Social Media Fans")
social_media_fans.save

video_viewers_lookalike = lookalike.sub_categories.find_or_initialize_by(name: "Video Viewers")
video_viewers_lookalike.save

leads = lookalike.sub_categories.find_or_initialize_by(name: "Leads")
leads.save

devices_persona = lookalike.sub_categories.find_or_initialize_by(name: "Devices persona")
devices_persona.save

niche_lookalike = lookalike.sub_categories.find_or_initialize_by(name: "Niche Lookalike")
niche_lookalike.save
puts "Lookalike sub-categories added!"

# Retargeting sub-categories creation
basic_retargeting = retargeting.sub_categories.find_or_initialize_by(name: "Basic Retargeting")
basic_retargeting.save

time_based = retargeting.sub_categories.find_or_initialize_by(name: "Time Based")
time_based.save

niche_retargeting = retargeting.sub_categories.find_or_initialize_by(name: "Niche Retargeting")
niche_retargeting.save

category_affinity_retargeting = retargeting.sub_categories.find_or_initialize_by(name: "Category Affinity")
category_affinity_retargeting.save

product_affinity_retargeting = retargeting.sub_categories.find_or_initialize_by(name: "Product Affinity")
product_affinity_retargeting.save
puts "Retargeting sub-categories added!"

# Retention sub-categories creation
basic_retention = retention.sub_categories.find_or_initialize_by(name: "Basic Retention")
basic_retention.save

email_lists = retention.sub_categories.find_or_initialize_by(name: "Email Lists")
email_lists.save

post_purchase = retention.sub_categories.find_or_initialize_by(name: "Post Purchase")
post_purchase.save

reactivation = retention.sub_categories.find_or_initialize_by(name: "Reactivation")
reactivation.save

niche_retention = retention.sub_categories.find_or_initialize_by(name: "Niche Retention")
niche_retention.save

category_affinity_retention = retention.sub_categories.find_or_initialize_by(name: "Category Affinity")
category_affinity_retention.save

product_affinity_retention = retention.sub_categories.find_or_initialize_by(name: "Product Affinity")
product_affinity_retention.save

leads_retention = retention.sub_categories.find_or_initialize_by(name: "Leads")
leads_retention.save
puts "Retention sub-categories added!"
