require 'test_helper'

class VocabulatorHelperTest < ActiveSupport::TestCase

  include VocabulatorHelper
  
  test "should not find Primary Key's" do
    results = find_unit_terms(nitrogen_terms | [term("hectare meter","hec m")], "Primary Key's")    
    assert results.length == 0, show(results)
  end
  
  test "should find percentage" do
    results = find_unit_terms(nitrogen_terms | [percentage_term] | [term("degree", "description")], 'Feature field (%)')
    assert results[0] == percentage_term, show(results)
  end
  
  test "should find ug/L" do  
    results = find_unit_terms([term("micrograms per liter", "ug/L")], "Chlorophyll a ug/L")
    term = term("micrograms per liter", "ug/L")
    assert results[0] == term, show(results)
  end
  
  test "should find Dissolved Organic Carbon (DOC) mg/L" do
    results = find_unit_terms([term("micrograms per liter", "mg/L")], "Dissolved Organic Carbon (DOC) mg/L")
    term = term("micrograms per liter", "mg/L")
    assert results[0] == term, show(results)
  end
  
  test "should find Solids, fixed dissolved" do    
    results = find_closest_terms(solid_terms, "Solids, dissolved")
    term = term("Solids, fixed dissolved", "Fixed Dissolved Solids")
    assert results[0] == term, show(results)
  end

  test "should find Solids, total" do
    results = find_closest_terms(solid_terms, "total solids")
    assert results[0] == solid_terms[2], show(results)
  end

  test "should find lowercase solids" do
    results = find_wildcard_terms(solid_terms, "solids")
    assert results[0] == solid_terms[0], show(results)
  end

  test "should resolve N03+N02 to something with nitrogen" do
    results = find_wildcard_terms(nitrogen_terms, "NO3+NO2-N")
    term = term("Nitrogen, dissolved nitrate (NO3)", "Dissolved nitrate (NO3) nitrogen")
    assert results[0] == term , show(results)
  end  
  
  test "should not find TU in Feature ID%s" do
    results = find_unit_terms([term("tritium units", "TU")], "Feature ID%s")
    assert results.empty?
  end

  test "should find mg/L in mgL" do
    results = find_unit_terms([term("Milligrams per litre", "mg/L")], "Dissolved Oxygen mgL")
    assert !results.empty?
  end
  
  test "should not find cm^2 in Time" do
    results = find_unit_terms([term("square centimeter", "cm^2")], "Time")
    assert results.empty?
  end
  
  test "should find ug/L in Iron Dissolved ug/L" do
    results = find_unit_terms([term("micrograms per liter", "ug/L")], "Iron Dissolved ug/L")
    assert !results.empty?
  end
  
  private 
  
  def show(results)
    if results.nil? || results.empty?
      "Results are nil or empty"
    else
      message = ""
      results.each { |r| message = message + ", " + r.to_s }
      message
    end
  end
  
  def percentage_term
    term('percent', '%')
  end
  
  def term(name, description)
    { 'name' => name, 'description' => description }
  end

  def nitrogen_terms 
    [
      term("Nitrogen, dissolved nitrate (NO3)", "Dissolved nitrate (NO3) nitrogen"),
      term("Nitrogen, dissolved nitrite (NO2) + nitrate (NO3)", "Dissolved nitrite (NO2) + nitrate (NO3) nitrogen"),
      term("Nitrogen, nitrate (NO3)", "Nitrate (NO3) Nitrogen"),
      term("Nitrogen, nitrite (NO2) + nitrate (NO3)", "Nitrite (NO2) + Nitrate (NO3) Nitrogen"),
      term("Nitrogen, dissolved nitrite (NO2)", "Dissolved nitrite (NO2) nitrogen"),
      term("Nitrogen, nitrite (NO2)", "Nitrite (NO2) Nitrogen")
   ]
  end     
  
  def solid_terms
    [
      term("Solids, fixed dissolved", "Fixed Dissolved Solids"),
      term("Solids, fixed suspended", "Fixed Suspended Solids"),
      term("Solids, total", "Total Solids"),
      term("Solids, total dissolved", "Total Dissolved Solids"),
      term("Solids, total fixed", "Total Fixed Solids"),
      term("Solids, total suspended", "Total Suspended Solids"),
      term("Solids, total volatile", "Total Volatile Solids"),
      term("Solids, volatile dissolved", "Volatile Dissolved Solids"),
      term("Solids, volatile suspended", "Volatile Suspended Solids")
    ]    
  end
  
end
