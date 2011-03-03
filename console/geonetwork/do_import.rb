load 'mef_factory.rb'
load 'importer.rb'

temp_directory = 'tmp/mefs'

#MefFactory.new(temp_directory).build_all
Importer.new(temp_directory).upload_all

