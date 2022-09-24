require 'socket'

puts 'Digite o seu peso atual'
peso_atual = gets.chomp.to_i
puts 'Digite o peso que você deseja ter após emagrecer'
peso_objetivo = gets.chomp.to_i

server = TCPSocket.open('localhost', 3001) # conecta ao servidor na porta 3001
server.puts(peso_atual,peso_objetivo) # envia mensagem para o servidor

resp = server.recvfrom( 10000 ) # recebe a mensagem -10000 bytes - do servidor
puts resp

server.close 