xml.instruct!

xml.request do
  xml.id(@feature_type.id)
  xml.name(@feature_type.name)
  xml.description(@feature_type.description)
end