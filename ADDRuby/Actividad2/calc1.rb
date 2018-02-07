#!/usr/bin/ruby

num1=ARGV[0].to_i
op=ARGV[1]
num2=ARGV[2].to_i

if ARGV.size < 3
  puts "Para que el programa funcione debes insertar tres argumentos"
  puts "------------------------------------------------------------"
  exit
end

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
