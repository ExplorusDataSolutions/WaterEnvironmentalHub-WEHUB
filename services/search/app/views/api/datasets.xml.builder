xml.instruct!

xml.datasets do
  if !@datasets.nil?
    @datasets.each do |dataset|
      xml.dataset do
        xml.id(dataset.id)
        xml.name(dataset.name)
      end
    end
  end
end
