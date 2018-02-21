#!/usr/bin/ruby

file=ARGV[0]

rootornot = `whoami`

if rootornot.rstrip == "root"
  content = `cat #{file}`
  lines   = content.split("\n")
  lines.each do |i|
    name  = i.split(":")
    if name[4] == "add"
      system("sudo useradd -d /home/#{name[0]} #{name[0]} &> /dev/null")
      puts "se ha creado el usuario #{name[0]}"
    elsif name[4] == "delete"
      system("sudo userdel -r #{name[0]} &> /dev/null")
      puts "Borrado el usuario #{name[0]}"
    end
    if name[2] == ""
      puts "No se ha especificado un correo para el usuario #{name[0]}, debería incluirlo"
    end  
  end
else
  puts "no eres root, cerrando programa"
  exit
end
