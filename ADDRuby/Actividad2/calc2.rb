#!/usr/bin/ruby

fichero=ARGV[0]

if ARGV.size < 1
  puts "tienes que escribir un argumento para que el programa funcione"
  exit
else
  content = `cat #{fichero}`
  lines = content.split("\n")
  lines.each do |i|
    fields = i.split(" ")


  num1 = fields[0].to_i
  op = fields[1]
  num2 = fields[2].to_i

    if op == "+"
      sum = num1 + num2
      puts "El resultado de la suma entre #{num1} y #{num2} es igual a #{sum}"
    elsif op == "-"
      min = num1 - num2
      puts "El resultado de la resta entre #{num1} y #{num2} es igual a #{min}"
    elsif op == "x"
      mul = num1 * num2
      puts "El resultado de la multiplicación entre #{num1} y #{num2} es igual a #{mul}"
    elsif op == "/"
      div = num1 / num2
      puts "El resultado de la división entre #{num1} y #{num2} es igual a #{div}"
    end
  end
end
