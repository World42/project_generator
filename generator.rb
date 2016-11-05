#!/usr/bin/ruby

require 'erb'

if ARGV[0]
    project_name = ARGV[0]
else
    print "Enter project name : "
    project_name = gets.chomp
end

# ------------ Generate Infrastructure ------------- #

Dir.mkdir(project_name)
Dir.mkdir(project_name + "/sources")
Dir.mkdir(project_name + "/includes")

auteur = File.new(project_name + "/auteur", "w")
auteur.puts(ENV["LOGNAME"])
auteur.close

makefile_txt = File.open("makefile.erb", "r")
makefile_ex = ERB.new(makefile_txt.read)
makefile_txt.close

makefile_complete = makefile_ex.result()
makefile = File.new(project_name + "/Makefile", "w")
makefile.puts(makefile_complete)
makefile.close
