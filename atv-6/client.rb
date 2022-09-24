require 'socket'

puts 'Digite o valor gasto no restaurante'
valor_gasto = gets.chomp.to_i

server = TCPSocket.open('localhost', 3001) # conecta ao servidor na porta 3001
server.puts valor_gasto # envia mensagem para o servidor

resp = server.recvfrom( 10000 ) # recebe a mensagem -10000 bytes - do servidor
puts resp

server.close 