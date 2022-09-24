require 'socket' 
server = TCPServer.open(3001)  # Abre socket em escuta na porta 3001  
loop { # o servidor nunca morre, fica sempre executando
  client = server.accept      # aceita conexão do cliente
  msg_client = client.recvfrom( 10000 ) # recebe mensagem - 10000 bytes - do cliente
  msg_client = msg_client[0].split("\n")
  peso_atual = msg_client[0].to_f
  peso_objetivo = msg_client[1].to_f

  p peso_atual
  p peso_objetivo

  client.puts "Percentual de peso a ser eliminado: #{(1-(peso_objetivo/peso_atual))*100}%"
  client.close # fecha conexão
}
