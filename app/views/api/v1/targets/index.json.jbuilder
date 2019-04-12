json.targets @targets.each do |target|
  json.partial! 'info', target: target
end
