#!/usr/bin/ruby

file=ARGV[0]

if ARGV.size != 1
  puts "----------- Menú de ayuda -----------"
  puts "Se debe introducir el nombre de un fichero de texto"
  puts "Ejemplo: ./deleteusers.rb nombre_de_fichero"
  exit
else
  content = `cat #{file}`
  lines   = content.split("\n")
  lines.each do |i|
    user  = i.split(" ")
    check = system("cat /etc/passwd | grep #{user[0]}")
      if check == true
        `sudo userdel -r #{user[0]}`
        puts "Borrado el usuario #{user[0]}"
      else
        puts "El usuario #{user[0]} no está en el sistema" 
      end
  end
end
