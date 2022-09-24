require 'socket'

puts 'Digite o valor do produto'
valor_produto = gets.chomp.to_i

server = TCPSocket.open('localhost', 3001) # conecta ao servidor na porta 3001
server.puts valor_produto # envia mensagem para o servidor

resp = server.recvfrom( 10000 ) # recebe a mensagem -10000 bytes - do servidor
puts resp

server.close 