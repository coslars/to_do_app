task :parse_jninka_xml do
  desc 'Parse out the jninka xml file'

  # the pwd is the apps root (i.e. /to_do_app)

  # Parse out the XML file
  doc = Ox.parse(IO.read('redstone'))

  # Get a collection of all the <fileName> elements whose parent is CodeScan -> File
  doc.locate('CodeScan/File/fileName').each { |e|  puts e.nodes[0] }

=begin
  # This is another way to look at the documents
  doc.root.nodes.each do |e|
    puts e.fileName.text
    puts e.attribution.id.text
    puts e.attribution.matchname.text
  end
=end

end
