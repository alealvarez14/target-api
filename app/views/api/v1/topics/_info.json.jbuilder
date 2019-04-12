json.id         topic.id
json.title      topic.title
json.icon_url   url_for(topic.icon) if topic.icon.attached?
