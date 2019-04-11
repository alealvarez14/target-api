json.topics @topics.each do |topic|
  json.partial! 'api/v1/topics/info', topic: topic
end
