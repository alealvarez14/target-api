json.topics @topics.each do |topic|
  json.partial! 'info', topic: topic
end
