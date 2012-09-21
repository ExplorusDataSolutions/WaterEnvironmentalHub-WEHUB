xml.instruct!
xml.terms do
  @terms.each do |term|
    xml.term do
      xml.id term.id
      xml.name term.name
      xml.description term.description
      xml.count term.count
    end
  end
end
